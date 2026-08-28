MODULE_NAME := snd-soc-acp6x-mach
PACKAGE_NAME := acp6x-mach
PACKAGE_VERSION := 1.0
SRC_DIR := /usr/src/$(PACKAGE_NAME)-$(PACKAGE_VERSION)

obj-m += $(MODULE_NAME).o
$(MODULE_NAME)-objs := acp6x-mach.o

KVERSION ?= $(shell uname -r)
KDIR ?= /lib/modules/$(KVERSION)/build
PWD := $(shell pwd)

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

# Pasang langsung ke kernel aktif (tanpa DKMS)
install: all
	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
	depmod -a $(KVERSION)

# Daftarkan dan pasang via DKMS untuk update kernel otomatis
dkms_install:
	mkdir -p $(SRC_DIR)
	cp -r * $(SRC_DIR)/
	dkms add -m $(PACKAGE_NAME) -v $(PACKAGE_VERSION)
	dkms build -m $(PACKAGE_NAME) -v $(PACKAGE_VERSION)
	dkms install -m $(PACKAGE_NAME) -v $(PACKAGE_VERSION)

# Hapus dari sistem DKMS
dkms_uninstall:
	dkms remove -m $(PACKAGE_NAME) -v $(PACKAGE_VERSION) --all || true
	rm -rf $(SRC_DIR)
