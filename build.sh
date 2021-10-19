#!/bin/sh

if [ $# -eq 0 ]; then 
    echo "[ ! ] Please specify a file"
    exit 1
fi

echo "[ * ] Assemble byte code"
python ./tools/assembler/assembler.py $1
mv main.rs ./src/

echo "[ * ] Compile the source code"
RUSTFLAGS="-C relocation-model=dynamic-no-pic" cargo build 

echo "[ * ] Encrypt the binary"
python ./tools/encryptor/encryptor.py ./target/debug/madness 
mv ./code.h ./tools/decryptor/

echo "[ * ] Building the decryptor"
make -C ./tools/decryptor/ clean
make -C ./tools/decryptor/ 
mv ./tools/decryptor/madness ./
strip ./madness