
rm -rf build

FLUTTER="${FLUTTER:-flutter}"

$FLUTTER build web --web-renderer canvaskit
#flutter build web --web-renderer html
cp web/page.html build/web/

