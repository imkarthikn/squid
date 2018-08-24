count=$(cat /proc/net/dev | grep -i ens | awk -F ":" '{print $1}' | grep -v ens5  | tr -d " \t" | wc -l)
if [ "$count" -eq "0" ];
then 
interface=eth0
else
interface=$(cat /proc/net/dev | grep -i ens | awk -F ":" '{print $1}' | grep -v ens5  | tr -d " \t")
fi
echo $interface
sed -i '/HWADDR=/d' /etc/sysconfig/network-scripts/ifcfg-eth0
echo "HWADDR=" >> /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i '/DEVICE=/d' /etc/sysconfig/network-scripts/ifcfg-eth0
echo -e "DEVICE=$interface" >> /etc/sysconfig/network-scripts/ifcfg-eth0
sleep 30
sudo /sbin/ifup $interface
#sleep 30
#sudo /sbin/ifdown ens5

