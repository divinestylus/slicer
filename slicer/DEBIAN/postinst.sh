#!/usr/bin/env sh
set -e

# colors for echo message
RED='\033[0;31m'
Green='\033[0;32m'
# update man page database
echo "Updating man page database..."
if ! /usr/share/man/man1/mandb -q; then
# adds color to echo message
    echo "${RED}==================================="
    echo "Failed to update man page database."
    echo "${RED}==================================="
    exit 1
fi
echo "${Green}==================================="
echo "Man page database update successful."
echo "${Green}==================================="

exit 0
