feed=http://ipkg.nslu2-linux.org/feeds/optware/ds101g/cross/stable/
ipk_name=$(wget -qO- $feed/Packages | awk '/^Filename: ipkg-opt/ {print $2}')
wget $feed/$ipk_name
##FIXME
#ipk_name='ipkg-opt_0.99.163-10_powerpc.ipk'
tar -xOvzf $ipk_name ./data.tar.gz | tar -C / -xzvf -
echo "src/gz optware ${feed}" >> /opt/etc/ipkg.conf
mv /opt/bin/ipkg /opt/bin/ipkg.bin
echo '#!/bin/sh' > /opt/bin/ipkg
echo 'PATH=/opt/bin:$PATH /opt/bin/ipkg.bin $@' >> /opt/bin/ipkg
chmod +x /opt/bin/ipkg
rm $ipk_name
