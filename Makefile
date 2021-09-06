CXX = g++

APP = transmux_encrypt

INCLUDE = -I../shaka-packager/src/ -I../shaka-packager/src/packager/

SRC = transmux_encrypt.cc

OBJ = transmux_encrypt.o

SHAKA_LIB_BASE = ../shaka-packager/src/out/Release/

CPPFLAGS = -std=c++11

LIBS_PATH = -L$(SHAKA_LIB_BASE)/ -L$(SHAKA_LIB_BASE)/obj/base/ -L$(SHAKA_LIB_BASE)/obj/third_party/ -L$(SHAKA_LIB_BASE)/obj/file/ -L$(SHAKA_LIB_BASE)/obj/base/third_party/libevent/ -L$(SHAKA_LIB_BASE)/obj/base/third_party/dynamic_annotations/ -L$(SHAKA_LIB_BASE)/obj/ -L$(SHAKA_LIB_BASE)/obj/hls/ -L$(SHAKA_LIB_BASE)/obj/media/ -L$(SHAKA_LIB_BASE)/obj/media/base/ -L$(SHAKA_LIB_BASE)/obj/third_party/protobuf/ -L$(SHAKA_LIB_BASE)/obj/third_party/libxml/ -L$(SHAKA_LIB_BASE)/obj/third_party/zlib/ -L$(SHAKA_LIB_BASE)/obj/mpd/ -L$(SHAKA_LIB_BASE)/obj/media/chunking/ -L$(SHAKA_LIB_BASE)/obj/media/codecs/ -L$(SHAKA_LIB_BASE)/obj/media/crypto/ -L$(SHAKA_LIB_BASE)/obj/media/demuxer/ -L$(SHAKA_LIB_BASE)/obj/media/formats/ -L$(SHAKA_LIB_BASE)/obj/third_party/libpng/ -L$(SHAKA_LIB_BASE)/obj/media/formats/mp4/ -L$(SHAKA_LIB_BASE)/obj/media/event/ -L$(SHAKA_LIB_BASE)/obj/media/origin/ -L$(SHAKA_LIB_BASE)/obj/media/formats/packed_audio/ -L$(SHAKA_LIB_BASE)/obj/media/formats/mp2t/ -L$(SHAKA_LIB_BASE)/obj/media/formats/dvb/ -L$(SHAKA_LIB_BASE)/obj/media/formats/ttml/ -L$(SHAKA_LIB_BASE)/obj/third_party/zlib/ -L$(SHAKA_LIB_BASE)/obj/third_party/boringssl/ -L$(SHAKA_LIB_BASE)/obj/third_party/icu/ -L$(SHAKA_LIB_BASE)/obj/third_party/modp_b64/ -L$(SHAKA_LIB_BASE)/obj/third_party/gflags/ -L$(SHAKA_LIB_BASE)/obj/version/ -L$(SHAKA_LIB_BASE)/obj/third_party/curl/ -L$(SHAKA_LIB_BASE)/obj/media/formats/webm/ -L$(SHAKA_LIB_BASE)/obj/third_party/libwebm/ -L$(SHAKA_LIB_BASE)/obj/media/event/ -L$(SHAKA_LIB_BASE)/obj/media/formats/ -L$(SHAKA_LIB_BASE)/obj/media/formats/webvtt/ -L$(SHAKA_LIB_BASE)/obj/media/trick_play/ -L$(SHAKA_LIB_BASE)/obj/media/formats/wvm/ -L$(SHAKA_LIB_BASE)/obj/media/replicator/

LIBS = -lpackager -lcrypto -lttml -lmpd_builder -lhls_builder -lfile -levent -lwidevine_pssh_data_proto -lstatus -lpacked_audio -ltrick_play -ldemuxer -lmp4 -lxml2 -licuuc -lchrome_zlib -lzlib_x86_simd -lgflags -lmp2t -lwebm -lmedia_event -lcodecs -ldvb -lpng -lmedia_base -lbase -lbase_static -lmodp_b64 -lwidevine_common_encryption_proto -levent -lversion -lsymbolize -lmanifest_base -lwebvtt -lwvm -lreplicator -lchunking -lmedia_info_proto -lprotobuf_full_do_not_use -lmkvmuxer -lcurl -lboringssl -lboringssl_asm -lrt -ldl -latomic -lm -lpthread -lstdc++

all: $(APP)

$(APP): $(SRC)

	$(CXX) -g -O $(CPPFLAGS) $(SRC) $(INCLUDE) $(LIBS_PATH) $(LIBS) -o $(APP)

clean:
	rm transmux_encrypt
