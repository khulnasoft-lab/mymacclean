#!/bin/sh

# Installer path
CMM_PATH=`pwd`

# Making the directory for installation
echo ""
echo "Creating installation folder..."
mkdir -p ~/.mymacclean

# Copying Clean My macOS to home directory
echo "Copying files..."
echo "/Users/$USER/.mymacclean" > ~/.mymacclean/path
cp -R "${CMM_PATH}/" ~/.mymacclean

# Adding Clean My macOS in PATH for easy terminal access
echo "Adding mymacclean command to enviroment for quick access..."
ln -fs ~/.mymacclean/mymacclean.sh /usr/local/bin/mymacclean

# Moving Installer and uninstaller in different setup directory
echo "Moving installer & uninstaller to setup folder..."
cd ~/.mymacclean
mkdir -p "setup"
mv ~/.mymacclean/install.sh ~/.mymacclean/setup/install.sh
mv ~/.mymacclean/uninstall.sh ~/.mymacclean/setup/uninstall.sh

# Making the scripts executable and removing extended attributes
echo "Making the scripts executable..."
xattr -rc ~/.mymacclean/
chmod +x ~/.mymacclean/mymacclean.sh

# Removing leftover installation files
rm -rf ${CMM_PATH}

echo ""
echo "Clean My macOS has been installed and can be run by typing 'mymacclean'."
echo "For help, run 'mymacclean help'."
echo ""
