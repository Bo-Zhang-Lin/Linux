CPU=host
SMP=2
MEMORY=1024
HDA=linux1.img
HDA_SIZE=10G
MAC="DE:AD:BE:CF:EC:B6"
BRIDGE=br50

qemu-system-x86_64 -enable-kvm -cpu $CPU -smp $SMP -m $MEMORY \
-drive file=$HDA,format=qcow2 \
-net nic,macaddr=$MAC -net bridge,br=$BRIDGE \
-boot d
