#Cleaning up the unity bar
/usr/bin/dconf dump / > /home/vagrant/user_dconf_config
sed -ri 's/ubuntu-amazon-default.desktop/atom.desktop/g' /home/vagrant/user_dconf_config
/usr/bin/dconf load / < /home/vagrant/user_dconf_config
rm /home/vagrant/user_dconf_config
