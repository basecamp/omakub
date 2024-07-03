# Check if the system is Ubuntu and check the Ubuntu version

min_version="24.04"

if ! ubuntu_version=$(lsb_release -rs 2>/dev/null); then
    echo "This script is intended for Ubuntu systems only."
    exit 1
fi

if awk -v ver="$ubuntu_version" -v min="$min_version" '
    BEGIN {
        split(ver, a, ".");
        split(min, b, ".");
        for (i in b) {
            if (a[i] < b[i]) exit 1;
            if (a[i] > b[i]) exit 0;
        }
    }'; then
    echo "Success: Ubuntu version $ubuntu_version meets the minimum requirement of $min_version"
    exit 0
else
    echo "Error: Ubuntu version $ubuntu_version is lower than the required version $min_version"
    exit 1
fi