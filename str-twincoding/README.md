
## Orchid Storage Project 

_*Orchid Storage is a **work in progress***_

Orchid is an open source project.  Help us in the effort to build a truly decentralized, incentive-aligned
storage system.  
Check out the [Storchid Litepaper](https://orchid.com/storchid-litepaper-latest.pdf)
and join the discussion on the [Orchid Subreddit](https://www.reddit.com/r/orchid).

This repository contains work in progress on the file encoding CLI and server framework.


![monitor](docs/monitor.png "Monitor")

A key aspect of the Orchid Storage project is the use of an efficient encoding scheme that minimizes
bandwidth costs incurred during migration of distributed data through providers over time.

**Twin Coding** is a hybrid encoding scheme that works with any two linear coding schemes and combines
them to achieve a space-bandwidth tradeoff, minimizing the amount of data that must be transferred
between storage nodes in order to recover a lost shard of data. In contrast to a traditional
erasure scheme, in which restoration of a lost node requires a full reconstruction of the original
file, Twin Coding allows for the recovery of a lost data shard with data transfer totalling exactly
the size of the lost data shard, with no additional transfer overhead.


This repository contains an implementation of Twin Coding, as well as a command line API for encoding 
files, decoding files with erasures, and optimally recovering lost shards. 

See [`twin_coding.py`](encoding/twin_coding.py) for an explanation of the algorithm, example code, and a link to the original paper.


## Installation

```
# Create a virtual environment
python3 -m venv venv
```

```
# Activate the virtual environment
# For macOS and Linux:
source venv/bin/activate
# For Windows:
.\venv\Scripts\activate
```

```
# Install the dependencies
pip install -r requirements.txt
```

## Example Usage
```
# Generate some test files
test-content.sh

# Import a file into the default local repository with default encoding
storage.sh import data/foo_file.dat

# List the repository
storage.sh repo list

# Start a test provider server cluster
test-cluster.sh start 5001 5002 5003 5004 5005

# Confirm that the test servers are running
test-cluster.sh list

# "Discover" these providers, adding them to our known provider list
# This will normally be done via the directory service and performed at file push time.
test-discover.sh 5001 5002 5003 5004 5005

# Start the monitor application (in another window)
monitor.sh --update 1

# Push the file by name
storage.sh push foo_file.dat

# TODO:
# Monitor file availability while:
#   Observing resilient upload progress
#   Killing servers and prompting efficient rebuilds

# Shut downt the servers
test-cluster.sh stop
```

## Encoding CLI Examples

See also [`examples.sh`](examples/examples.sh)

```
# Encode a file, writing n files for each of the two node types to a ".encoded" directory.
encoded_file_path=$(storage.sh repo --path "$repository" file_path --file "$file")
storage.sh encode \
  --path "$file" \
  --output_path "$encoded_file_path" \
  --encoding0 reed_solomon --k0 3 --n0 5 \
  --encoding1 reed_solomon --k1 3 --n1 5 \
  --overwrite

# This import command is equivalent to the above encode, usign the default repository path and encoding type.
storage.sh import "$file"

# List files in the repository.
storage.sh repo --path "$repository" list

# Decode a file from an encoded storage directory, tolerant of missing files (erasures).
recovered_file=$(storage.sh repo --path "$repository" tmp_file_path --file "recovered_${file}")
storage.sh decode \
  --encoded "$encoded_file_path" \
  --recovered "$recovered_file" \
  --overwrite

# Compare the original and decoded files.
cmp -s "$file" "$recovered_file" && echo "Passed" || echo "Failed"


# Prepare node recovery: Generate shard recovery source files for restoration of
# node type 1 index 0, using 3 (k) type 0 node sources (helper nodes),
recover_node_type=1
recover_node_index=0
for helper_node_index in 0 1 2
do
  helper_node_type=0
  helper_shard_file=$(storage.sh repo --path "$repository" shard_path \
      --file "$file" --node_type $helper_node_type --node_index $helper_node_index)
  recovery_source_file=$(storage.sh repo --path "$repository" recovery_file_path \
      --file "$file" --recover_node_type $recover_node_type --recover_node_index $recover_node_index \
      --helper_node_index "$helper_node_index")
  storage.sh generate_recovery_file \
    --recover_node_type $recover_node_type \
    --recover_node_index $recover_node_index \
    --recover_encoding reed_solomon --k 3 --n 5 \
    --data_path "$helper_shard_file" \
    --output_path "$recovery_source_file" \
    --overwrite
done


# Complete node recovery: Recover the shard for node type 1 index 0 from the k (3) recovery files.
recovered_shard_file=$(storage.sh repo --path "$repository" tmp_file_path \
    --file "recovered_${file}_type${recover_node_type}_node${recover_node_index}.dat")
storage.sh recover_node \
  --k 3 --n 5 --encoding reed_solomon \
  --recover_node_type $recover_node_type \
  --recover_node_index $recover_node_index \
  --files_dir "$encoded_file_path" \
  --output_path "$recovered_shard_file" \
  --overwrite

# Compare the original and recovered data shards.
original_shard_file=$(storage.sh repo --path "$repository" shard_path \
    --file "$file" --node_type 1 --node_index 0)
cmp -s "$original_shard_file" "$recovered_shard_file" && echo "Passed" || echo "Failed"

```

## CLI Docs

###`repo`
```
usage: storage repo [-h] [--path PATH] REPO_COMMAND ...

positional arguments:
  REPO_COMMAND        Repository path commands available.
    list              List files in the repository.
    file_path         Get the path to an encoded file.
    shard_path        Get the path to a shard of the encoded file.
    recovery_file_path
                      Get the path for a recovery file.
    tmp_file_path     Get the path for a temporary file.

options:
  -h, --help          show this help message and exit
  --path PATH         Path to the repository.
None
```
###`encode`
```
usage: storage encode [-h] --path PATH --output_path OUTPUT_PATH --k0 K0 --n0
                      N0 --k1 K1 --n1 N1 [--encoding0 ENCODING0]
                      [--encoding1 ENCODING1] [--overwrite]

options:
  -h, --help            show this help message and exit
  --path PATH           Path to the file to encode.
  --output_path OUTPUT_PATH
                        Output path for the encoded file.
  --k0 K0               k value for node type 0.
  --n0 N0               n value for node type 0.
  --k1 K1               k value for node type 1.
  --n1 N1               n value for node type 1.
  --encoding0 ENCODING0
                        Encoding for node type 0.
  --encoding1 ENCODING1
                        Encoding for node type 1.
  --overwrite           Overwrite existing files.
None
```
###`decode`
```
usage: storage decode [-h] --encoded ENCODED --recovered RECOVERED
                      [--overwrite]

options:
  -h, --help            show this help message and exit
  --encoded ENCODED     Path to the encoded file.
  --recovered RECOVERED
                        Path to the recovered file.
  --overwrite           Overwrite existing files.
None
```
###`generate_recovery_file`
```
usage: storage generate_recovery_file [-h] --recover_node_type
                                      RECOVER_NODE_TYPE --recover_node_index
                                      RECOVER_NODE_INDEX
                                      [--recover_encoding RECOVER_ENCODING]
                                      --k K --n N --data_path DATA_PATH
                                      --output_path OUTPUT_PATH [--overwrite]

options:
  -h, --help            show this help message and exit
  --recover_node_type RECOVER_NODE_TYPE
                        Type of the recovering node.
  --recover_node_index RECOVER_NODE_INDEX
                        Index of the recovering node.
  --recover_encoding RECOVER_ENCODING
                        Encoding for the recovering node.
  --k K                 k value for the recovering node.
  --n N                 n value for the recovering node.
  --data_path DATA_PATH
                        Path to the source node data.
  --output_path OUTPUT_PATH
                        Path to the output recovery file.
  --overwrite           Overwrite existing files.
None
```
###`recover_node`
```
usage: storage recover_node [-h] --recover_node_type RECOVER_NODE_TYPE
                            --recover_node_index RECOVER_NODE_INDEX --k K --n
                            N [--encoding ENCODING] --files_dir FILES_DIR
                            --output_path OUTPUT_PATH [--overwrite]

options:
  -h, --help            show this help message and exit
  --recover_node_type RECOVER_NODE_TYPE
                        Type of the recovering node.
  --recover_node_index RECOVER_NODE_INDEX
                        Index of the recovering node.
  --k K                 k value for node type.
  --n N                 n value for node type.
  --encoding ENCODING   Encoding for node type.
  --files_dir FILES_DIR
                        Path to the recovery files.
  --output_path OUTPUT_PATH
                        Path to the recovered file.
  --overwrite           Overwrite existing files.
None
```
###`import`
```
usage: storage import [-h] [--repo REPO] [--k0 K0] [--n0 N0] [--k1 K1]
                      [--n1 N1] [--encoding0 ENCODING0]
                      [--encoding1 ENCODING1] [--overwrite]
                      path

positional arguments:
  path                  Path to the file to import.

options:
  -h, --help            show this help message and exit
  --repo REPO           Path to the repository.
  --k0 K0               k value for node type 0.
  --n0 N0               n value for node type 0.
  --k1 K1               k value for node type 1.
  --n1 N1               n value for node type 1.
  --encoding0 ENCODING0
                        Encoding for node type 0.
  --encoding1 ENCODING1
                        Encoding for node type 1.
  --overwrite           Overwrite existing files.
None
```
###`push`
```
usage: storage push [-h] [--repo REPO] [--servers [SERVERS ...]] [--validate]
                    file

positional arguments:
  file                  Name of the file in the repository.

options:
  -h, --help            show this help message and exit
  --repo REPO           Path to the repository.
  --servers [SERVERS ...]
                        List of server names or urls to push to.
  --validate            After push, download and reconstruct the file.
None
```

## Server Docs
```
Using default repository: /Users/pat/Desktop/OrchidProject/lab.orchid.com/orchid/str-twincoding/repository
usage: server_cli.py [-h] [--config CONFIG] [--interface INTERFACE]
                     [--port PORT] [--repository_dir REPOSITORY_DIR]
                     [--auth_key AUTH_KEY] [--show_console]

Flask server with argument parsing

options:
  -h, --help            show this help message and exit
  --config CONFIG       server config file
  --interface INTERFACE
                        Interface the server listens on
  --port PORT           Port the server listens on
  --repository_dir REPOSITORY_DIR
                        Directory to store repository files
  --auth_key AUTH_KEY   Authentication key to validate requests
  --show_console        Flag to show console logs
```

## Monitor Docs
```
usage: monitor_cli.py [-h] [--providers PROVIDERS] [--debug] [--update UPDATE]

Process command line arguments.

options:
  -h, --help            show this help message and exit
  --providers PROVIDERS
                        Providers file path
  --debug               Show debug
  --update UPDATE       Update view with polling period seconds
```
