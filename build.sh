rm -rf Bundle
rm -rf docs
mkdir docs
carton bundle -Xswiftc -Xclang-linker -Xswiftc -mexec-model=reactor
mv Bundle/** docs/
rm -rf Bundle