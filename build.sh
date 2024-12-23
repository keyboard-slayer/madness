#!/bin/sh

if [ $# -eq 0 ]; then 
    echo "[ ! ] Please specify a file"
    exit 1
fi

echo "[ * ] Assemble byte code"
python ./tools/assembler/assembler.py $1
mv main.rs ./src/

echo "[ * ] Compile the source code"
RUSTFLAGS="-C relocation-model=dynamic-no-pic -C target-feature=+crt-static" cargo build 

echo "[ * ] Encrypt the binary"
python ./tools/encryptor/encryptor.py ./target/debug/madness 
mv ./code.h ./tools/decryptor/

echo "[ * ] Building the decryptor"
pushd . > /dev/null
cd ./tools/decryptor/
make clean
make
popd > /dev/null
mv ./tools/decryptor/madness ./
strip ./madness
