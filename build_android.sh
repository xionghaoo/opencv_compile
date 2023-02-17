#!bin/bash

# current compile all module
# OpenCV modules:
# --     To be built:                 aruco barcode bgsegm bioinspired calib3d ccalib core datasets dnn dnn_objdetect dnn_superres dpm face features2d flann fuzzy gapi hfs highgui img_hash imgcodecs imgproc intensity_transform java line_descriptor mcc ml objdetect optflow phase_unwrapping photo plot quality rapid reg rgbd saliency shape stereo stitching structured_light superres surface_matching text tracking ts video videoio videostab wechat_qrcode xfeatures2d ximgproc xobjdetect xphoto
# --     Disabled:                    world

CV_VERSION=4.6.0
CURRENT_DIR=$(pwd)

if [ -d build ];then
    mkdir build && cd build
elif
    cd build
fi

export ANDROID_NDK=${CURRENT_DIR}/ndk/android-ndk-r21e
export ANDROID_SDK=${CURRENT_DIR}/sdk/platform-tools
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
-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
-DANDROID_STL=c++_shared \
-DBUILD_SHARED_LIBS=OFF \
-DCMAKE_INSTALL_PREFIX=${CURRENT_DIR} \
-DANT_EXECUTABLE="/usr/bin" \
-DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib-${CV_VERSION}/modules ../opencv-${CV_VERSION}

make -j$(nproc)

make install
