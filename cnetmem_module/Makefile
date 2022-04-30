SHELL = /bin/sh
INSTALL = /usr/bin/install -c
mkdir_p = mkdir -p
build_dir = /lib/modules/$(shell uname -r)
OFED_CFLAGS = -I/var/lib/dkms/mlnx-ofed-kernel/3.1/build/include -include /var/lib/dkms/mlnx-ofed-kernel/3.1/build/include/linux/compat-2.6.h
KSYMVERS = /var/lib/dkms/mlnx-ofed-kernel/3.1/build/Module.symvers
NOSTDINC_FLAGS += -I/var/lib/dkms/mlnx-ofed-kernel/3.1/build/include -include /var/lib/dkms/mlnx-ofed-kernel/3.1/build/include/linux/compat-2.6.h
ccflags-y  += -w

cnetmemmoduledir = /lib/modules/$(shell uname -r)/extra/cnetmem
cnetmemmodule := cnetmem.ko
src_dir := ./
nbdxadm := nbdxadm

all: all-spec

install: all
	$(mkdir_p) $(DESTDIR)$(cnetmemmoduledir)
	$(INSTALL) -m 644 $(src_dir)/$(cnetmemmodule) $(DESTDIR)$(cnetmemmoduledir)/$(cnetmemmodule)
	-/sbin/depmod -a
	-\cp $(nbdxadm)/nbdxadm /usr/local/bin/

uninstall:
	rm -f $(DESTDIR)$(cnetmemmoduledir)/$(cnetmemmodule)
	-/sbin/depmod -a
	-rm -f /usr/local/bin/nbdxadm

clean:
	$(MAKE) -C $(build_dir)/build SUBDIRS=`pwd` clean

obj-m := cnetmem.o

cnetmem-objs :=     \
	alf_queue.o     \
	rdmabox.o       \
	diskbox.o       \
	cnetmem_mempool.o   \
	radixtree.o     \
	cnetmem_configfs.o  \
	cnetmem_drv.o

all-spec:
	$(MAKE) -C $(build_dir)/build SUBDIRS=`pwd` KBUILD_EXTRA_SYMBOLS="$(KSYMVERS)" modules
