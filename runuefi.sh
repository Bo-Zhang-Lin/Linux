CPU=host 
SMP=2
MEMORY=8192
HDA=linux_uefi.img
HDA_SIZE=20G
MAC="DE:AD:BE:CF:EC:DB"
BRIDGE=br20

qemu-system-x86_64 -bios /usr/share/ovmf/OVMF.fd \
-enable-kvm -cpu $CPU -smp $SMP -m $MEMORY \
-drive file=$HDA,format=qcow2 \
-vga qxl \
-boot c \
-net nic,macaddr=$MAC -net bridge,br=$BRIDGE

