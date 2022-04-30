cd ../cnetmem_module
make clean
cd ../setup
./get_module.symvers.sh
cd ../cnetmem_module
make
sudo make install

cd ../rmem_donor
make clean
make
cd ../setup
