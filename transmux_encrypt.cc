#include <iostream>
#include "packager/packager.h"
#include "packager/app/stream_descriptor.h"

using namespace std;
using namespace shaka;

std::vector<uint8_t> HexToBytes(const std::string& hex) {
  std::vector<uint8_t> bytes;

  for (unsigned int i = 0; i < hex.length(); i += 2) {
    std::string byteString = hex.substr(i, 2);
    uint8_t byte = (uint8_t) strtol(byteString.c_str(), NULL, 16);
    bytes.push_back(byte);
  }

  return bytes;
}

int main(int argc, char** argv) {
    Packager packager;
    PackagingParams packaging_params;
    vector<StreamDescriptor> stream_descriptors;
    StreamDescriptor stream_descriptor;

    if (argc < 3)
    {
        cout << "Usage: transmux_encrypt [input_file] [output_file]" << endl;
        return 1;
    }

    stream_descriptor.input = argv[1];
    stream_descriptor.stream_selector = "video";

    if (string(argv[2]).find(".ts") != string::npos)
    {
        // stream_descriptor.segment_template must be specified for TS segment. Single TS segment is not allowed.
        stream_descriptor.segment_template = "video_$Number$.ts";
        // stream_descriptor.output is not allowed for transport stream.
    }
    else if (string(argv[2]).find(".mp4") != string::npos)
    {
        stream_descriptor.output = argv[2];
    }

    stream_descriptors.push_back(stream_descriptor);

    ChunkingParams& chunking_params = packaging_params.chunking_params;
    chunking_params.segment_duration_in_seconds = 4;

    EncryptionParams& encryption_params = packaging_params.encryption_params;
    encryption_params.key_provider = KeyProvider::kRawKey;

    string pssh_string = "000000317073736800000000EDEF8BA979D64ACEA3C827DCD51D21ED00000011220F7465737420636F6E74656E74206964";
    vector<uint8_t> pssh_vector = HexToBytes(pssh_string);
    encryption_params.raw_key.pssh = pssh_vector;

    string iv_string = "73fbe3277bdf0bfc5217125bde4ca589";
    vector<uint8_t> iv_vector = HexToBytes(iv_string);
    encryption_params.raw_key.iv = iv_vector;

    RawKeyParams::KeyInfo& key_info = encryption_params.raw_key.key_map[""];

    string key_id_string = "abba271e8bcf552bbd2e86a434a9a5d9";
    vector<uint8_t> key_id_vector = HexToBytes(key_id_string);
    key_info.key_id = key_id_vector;

    string key_string = "69eaa802a6763af979e8d1940fb88392";
    vector<uint8_t> key_vector = HexToBytes(key_string);

    key_info.key = key_vector;

    shaka::Status status = packager.Initialize(packaging_params,
                                                stream_descriptors);
    if (!status.ok()) 
    {
        cout << "Error: Failed to initialize packager!!! Error: " << status.ToString() << endl;
        exit(1);
    }

    status = packager.Run();
    if (!status.ok()) 
    {
        cout << "Error: Failed to run packager!!! Error: " << status.ToString() << endl;
        exit(1);
    }
}
