CPU=host
SMP=2
MEMORY=2048
HDA=pxeserver.img
MAC="DE:AD:BE:CF:EC:B7"
BRIDGE=br50

qemu-system-x86_64 -enable-kvm -cpu $CPU -smp $SMP -m $MEMORY \
-drive file=$HDA,format=qcow2 \
-net nic,macaddr=$MAC -net bridge,br=$BRIDGE \
-boot c
