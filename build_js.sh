# compile opencv to build_js/bin/opencv.js
emcmake python ./opencv-4.x/platforms/js/build_js.py build_js
 cp ./build_js/bin/opencv.js ~/share/
