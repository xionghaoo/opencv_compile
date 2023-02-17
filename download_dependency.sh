#!bin/bash

CV_VERSION=4.6.0

# install dependncy package
sudo apt update && sudo apt install -y cmake g++ wget unzip openjdk-11-jdk ant

# download tools
wget -O opencv.zip https://github.com/opencv/opencv/archive/${CV_VERSION}.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/${CV_VERSION}.zip
unzip opencv.zip
unzip opencv_contrib.zip
mkdir -p build 

# download ndk tool
wget -O ndk.zip https://dl.google.com/android/repository/android-ndk-r21e-linux-x86_64.zip
unzip ndk.zip -d ndk

# download sdk tool
wget -O platform-tools.zip https://dl.google.com/android/repository/platform-tools_r34.0.0-linux.zip?hl=zh-cn
unzip platform-tools.zip -d sdk


