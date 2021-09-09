# sample_app_using_shaka_packager
Shaka packager is a a very powerful tool for transmuxing and drm-encrypting video streams. This repository shows how to integrate Shaka packager as a media library in your own application, so that you can use it to transmux and encrypt streams.

You can check out Shaka packager source code from https://github.com/google/shaka-packager, put it on the same level as this repo. Follow https://google.github.io/shaka-packager/html/build_instructions.html to build Shaka packager on Ubuntu. Remember to build Shaka packager for release, "ninja -C out/Release". Then, cd to sample_app_using_shaka_packager/, "make" to build this repo, the output will be an executable named "transmux_encrypt". Run "./transmux_encrypt [input_file.mp4] [output_file.mp4]" to transmux and encrypt the input to generate the output. If you don't specify output file, the default output will be saved to output_video.mp4. 

"DRM raw key" is used to encrypt the content, so CENC (Common ENCryption)/AES128 counter mode is used to encrypt the input file by default. Encryption parameters such as key_id, key and iv are hardcoded in the program. 

To clean up the project, run "make clean".
