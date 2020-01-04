CPU=host
SMP=2
MEMORY=1024
HDA=linux1.img
HDA_SIZE=10G
MAC="DE:AD:BE:CF:EC:B6"
BRIDGE=br50
CDROM=/opt/iso/debian-10.1.0-amd64-netinst.iso

[ -f $HDA ] && rm $HDA
qemu-img create -f qcow2 $HDA $HDA_SIZE


qemu-system-x86_64 -enable-kvm -cpu $CPU -smp $SMP -m $MEMORY \
-drive file=$HDA,format=qcow2 \
-cdrom $CDROM \
-net nic,macaddr=$MAC -net bridge,br=$BRIDGE \
-boot d
