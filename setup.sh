cd

# set mirror server
sudo perl -p -i.bak -e 's%(deb(?:-src|)\s+)https?://(?!archive\.canonical\.com|security\.ubuntu\.com)[^\s]+%$1http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%' /etc/apt/sources.list

# Update Packages
sudo apt update && sudo apt upgrade -y
sudo apt install ninja-build libasound2-dev libavcodec-dev libavformat-dev libavutil-dev libboost-dev libcurl4-openssl-dev libgtk-3-dev libgif-dev libglu1-mesa-dev libharfbuzz-dev libmpg123-dev libopencv-dev libopus-dev libopusfile-dev libsoundtouch-dev libswresample-dev libtiff-dev libturbojpeg0-dev libvorbis-dev libwebp-dev libxft-dev uuid-dev xorg-dev gcc g++ gcc-9 g++-9 cmake -y
sudo apt install nginx certbot python3-certbot-nginx -y

# git setting
git config --global user.name sknjpn
git config --global user.email sknjpn@gmail.com

# Install OpenSiv3D
sudo apt install ninja-build libasound2-dev libavcodec-dev libavformat-dev libavutil-dev libboost-dev libcurl4-openssl-dev libgtk-3-dev libgif-dev libglu1-mesa-dev libharfbuzz-dev libmpg123-dev libopencv-dev libopus-dev libopusfile-dev libsoundtouch-dev libswresample-dev libtiff-dev libturbojpeg0-dev libvorbis-dev libwebp-dev libxft-dev uuid-dev xorg-dev gcc g++ gcc-9 g++-9 cmake -y
sudo rm /usr/bin/gcc
sudo rm /usr/bin/g++
sudo ln -s /usr/bin/gcc-9 /usr/bin/gcc
sudo ln -s /usr/bin/g++-9 /usr/bin/g++
git clone https://github.com/Siv3D/OpenSiv3D
pushd OpenSiv3D/Linux
mkdir build
pushd build
cmake -GNinja -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
pushd
cmake --build build
sudo cmake --install build
pushd

# Install Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install node

# Install Emscripten
git clone https://github.com/emscripten-core/emsdk.git
pushd emsdk
git pull
./emsdk install latest
./emsdk activate latest
pushd
echo "source ~/emsdk/emsdk_env.sh 2> /dev/null" >> .bashrc

# Install Nginx
sudo apt install nginx certbot python3-certbot-nginx -y
sudo ufw allow "Nginx Full"
sudo certbot --nginx -d sylife.jp

# clone SyLife
git clone https://github.com/sknjpn/SyLife
