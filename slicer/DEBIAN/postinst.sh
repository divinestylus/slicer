#!/usr/bin/env sh
set -e

# update man page database
echo "Updating man page database..."
if ! /usr/share/man/man1/mandb -q; then
    echo "Failed to update man page database."
    exit 1
fi
echo "Man page database update successful."

exit 0
