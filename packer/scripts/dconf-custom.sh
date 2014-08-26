#Cleaning up the unity bar
cd /home/vagrant
/usr/bin/dconf dump / > user_dconf_config
sed -ri 's/ubuntu-amazon-default.desktop/atom.desktop/g' user_dconf_config
/usr/bin/dconf load / < user_dconf_config
rm user_dconf_config
