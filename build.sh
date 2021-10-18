#!/bin/sh
echo "[ * ] Assemble byte code"
python ./tools/assembler/assembler.py $1
mv main.rs ./src/

echo "[ * ] Compile the source code"
cargo build --release 

echo "[ * ] Encrypt the binary"
python ./tools/encryptor/encryptor.py ./target/release/madness 
mv ./elf.h ./tools/decryptor/