import io
import os
import time
from typing import Optional

import math
import numpy as np
from tqdm import tqdm


# Note: We will parallelize these in a future update.  Lots of opportunity here to read chunks
# Note: in batches and perform encoding/decoding in parallel.

# Base for classes that read chunks from a single input file.
class ChunkReader:
    def __init__(self, path: str, chunk_size: int):
        self.path = path
        self.chunk_size = chunk_size
        self.file_length = os.path.getsize(path)
        self.num_chunks = math.ceil(self.file_length / self.chunk_size)
        self.mmap = None

    # Returns an ndarray that shares memory with the mmap.
    # The final chunk may be padded with zeros to fill the chunk size.
    def get_chunk(self, i: int) -> np.ndarray:
        if self.mmap is None:
            self.mmap = np.memmap(self.path, dtype='uint8', mode='r')

        start_idx = i * self.chunk_size
        end_idx = (i + 1) * self.chunk_size

        if start_idx >= self.file_length:
            raise IndexError("Start index is out of bounds.")

        end_idx = min(end_idx, self.file_length)
        chunk = self.mmap[start_idx:end_idx]  # inclusive:exclusive

        if end_idx - start_idx < self.chunk_size:
            padding_length = self.chunk_size - (end_idx - start_idx)
            chunk = np.concatenate((chunk, np.zeros(padding_length, dtype=chunk.dtype)))

        return chunk

    def update_pbar(self, ci: int, pbar: tqdm, start: float):
        rate = ci * self.chunk_size / (time.time() - start)
        pbar.set_postfix({"Rate": f"{rate / (1024 * 1024):.4f}MB/s"}, refresh=True)
        pbar.update(1)


# Base for classes that read chunks from multiple files in parallel.
class ChunksReader:
    def __init__(self,
                 file_map: dict[str, int],
                 chunk_size: int):
        self.files: [str] = list(file_map.keys())
        self.files_indices: [int] = list(file_map.values())
        self.chunk_size = chunk_size
        self.num_chunks = self.validate_files(
            files=self.files, file_indices=self.files_indices, chunk_size=chunk_size)
        self.mmaps = None

    # Validate that the files are of the same length and are a multiple of chunk_size.
    # Return the number of chunks.
    @staticmethod
    def validate_files(files: list[str], file_indices: [int], chunk_size: int) -> int:
        file_sizes = [os.path.getsize(file_path) for file_path in files]

        # Check if all files are the same length
        if len(set(file_sizes)) != 1:
            raise ValueError("Files are not the same length.")

        # Check if file_indices are unique
        if len(set(file_indices)) != len(file_indices):
            raise ValueError("File indices are not unique.")

        # Check if the file length is a multiple of chunk_size
        file_size = file_sizes[0]  # All sizes are the same, pick the first
        if file_size % chunk_size != 0:
            raise ValueError("File length is not a multiple of chunk_size.")

        return file_size // chunk_size

    # Read data chunks at index i from each of the (k) files.
    # The files have been previously validated to be a multiple of chunk_size.
    def get_chunks(self, i: int) -> [np.ndarray]:
        if i >= self.num_chunks:
            raise IndexError("chunk index is out of bounds.")

        if self.mmaps is None:
            self.mmaps = [np.memmap(f, dtype='uint8', mode='r') for f in self.files]

        start_idx = i * self.chunk_size
        end_idx = (i + 1) * self.chunk_size
        return [mmap[start_idx:end_idx] for mmap in self.mmaps]

    def update_pbar(self, ci: int, num_files: int, pbar: tqdm, start: float):
        rate = ci * self.chunk_size * num_files / (time.time() - start)
        pbar.set_postfix({"Rate": f"{rate / (1024 * 1024):.4f}MB/s"}, refresh=True)
        pbar.update(1)


def open_output_file(output_path: str, overwrite: bool) -> Optional[io.BufferedWriter]:
    if not overwrite and os.path.exists(output_path):
        print(f"Output file already exists: {output_path}.")
        return None

    # Make intervening directories if needeed
    directory = os.path.dirname(output_path)
    if directory:
        os.makedirs(directory, exist_ok=True)

    return io.BufferedWriter(open(output_path, 'wb'))
