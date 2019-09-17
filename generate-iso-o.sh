su -
sudo mount -o loop /tmp/CentOS-7-Minimal.iso /mnt/
sudo rm -rf /home/emumba/custom-cent-os-install/
mkdir /home/emumba/custom-cent-os-install/
shopt -s dotglob
cp -avRf /mnt/* /home/emumba/custom-cent-os-install/
umount /mnt/
cp /home/emumba/ks.cfg /home/emumba/custom-cent-os-install/
gedit /home/emumba/custom-cent-os-install/isolinux/isolinux.cfg
# Copy menu item in file manually
mkisofs -J -T -o /home/emumba/CentOS-KS.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -R -m TRANS.TBL -graft-points -V "CentOS 7 x86_64" /home/emumba/custom-cent-os-install/
isohybrid /home/emumba/CentOS-KS.iso
findmnt /dev/sdb/
dd if=/home/emumba/CentOS-KS.iso of=/dev/sdb bs=512k
