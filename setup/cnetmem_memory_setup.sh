sudo insmod ~/CNetMem/cnetmem_module/cnetmem.ko
sudo mount -t configfs none /sys/kernel/config

sudo ~/CNetMem/cnetmem_module/nbdxadm/nbdxadm -o create_host -i $1 -p ~/CNetMem/setup/cnetmem_module.list
sudo ~/CNetMem/cnetmem_module/nbdxadm/nbdxadm -o create_device -i $1 -d $1

ls /dev/cnetmem$1
sudo mkswap /dev/cnetmem$1
sudo swapon /dev/cnetmem$1

