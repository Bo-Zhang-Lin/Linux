CPU=host 
SMP=2
MEMORY=8192
HDA=linux_net.img
HDA_SIZE=20G
MAC="DE:AD:BE:CF:EA:DA"
BRIDGE=br50

[ -f $HDA ] && rm $HDA
qemu-img create -f qcow2 $HDA $HDA_SIZE

qemu-system-x86_64 \
-enable-kvm -cpu $CPU -smp $SMP -m $MEMORY \
-drive file=$HDA,format=qcow2 \
-vga qxl \
-boot n \
-net nic,macaddr=$MAC -net bridge,br=$BRIDGE

