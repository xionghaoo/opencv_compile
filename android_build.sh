#!bin/bash

rm -rf build
mkdir build && cd build

export ANDROID_NDK=/home/rabbit/opencv/android-ndk-r21e
export ANDROID_SDK=/home/rabbit/opencv/sdk/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

cmake -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
-DCMAKE_ANDROID_NDK=$ANDROID_NDK \
-DANDROID_SDK=$ANDROID_SDK \
-DANDROID_NATIVE_API_LEVEL=28 \
-DBUILD_ANDROID_PROJECTS=OFF \
-DBUILD_ANDROID_EXAMPLES=OFF \
-DCMAKE_BUILD_TYPE=Release  \
-DBUILD_JAVA=ON  \
-DBUILD_ZLIB=ON \
-DANDROID_ABI=arm64-v8a \
-DBUILD_FAT_JAVA_LIB=ON \
-DBUILD_opencv_java=ON \
-DBUILD_opencv_videoio=ON \
-DBUILD_opencv_video=ON \
-DBUILD_opencv_gapi=ON \
-DBUILD_opencv_tracking=ON \
-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
-DANDROID_STL=c++_shared \
-DBUILD_SHARED_LIBS=OFF \
-DCMAKE_INSTALL_PREFIX=/home/rabbit/opencv/ \
-DANT_EXECUTABLE="/usr/bin" \
-DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib-4.x/modules ../opencv-4.x

make -j$(nproc)

make install
