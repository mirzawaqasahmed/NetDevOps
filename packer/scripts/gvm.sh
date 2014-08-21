# Install GVM

export GO_VERSION=1.3.1

echo "Installing GVM"
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

echo "Enabling GVM"
source /home/vagrant/.gvm/scripts/gvm

echo "Installing specific GO version "$GO_VERSION
gvm install go1.3.1 -B

echo "Setting default Go version"
echo "gvm use go"$GO_VERSION >> /home/vagrant/.bashrc
