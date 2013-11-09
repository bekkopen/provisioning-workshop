#!/bin/bash

sudo mkdir -p ~vagrant/.ssh ~root/.ssh

sudo cp /vagrant/ssh/client/id_rsa /vagrant/ssh/client/id_rsa.pub ~vagrant/.ssh/ && echo "Copied ssh files for vagrant sucessfully." || echo "Copying ssh files for vagrant failed."
sudo touch ~vagrant/.ssh/authorized_keys
[ $(grep vagrant@localhost.localdomain ~vagrant/.ssh/authorized_keys | wc -l) -eq 2 ] && echo "Public keys for vagrant exists allready." || sudo cat /vagrant/ssh/{policyserver,client}/id_rsa.pub >> ~vagrant/.ssh/authorized_keys
echo "Installed .ssh files for vagrant client."

sudo cp /vagrant/ssh/client/id_rsa /vagrant/ssh/client/id_rsa.pub ~root/.ssh/ && echo "Copied ssh files for root sucessfully." || echo "Copying ssh files failed."
sudo touch ~root/.ssh/authorized_keys

steinims_key="ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAo114ixCPpMS66KVIsj+wEKyjpNSIh48abP8bAK73JHFNVqyJn1kz015oyoc0NZJn7pd318evAlYF82Vu25cpJK7rFL+2QvI/asgrj0XmwV3DUuqWlieV6DR6XdWHJYUPvs+mPftX23ctmbIO7JfUPZ+pD5ixCdcvAQYFTu6ofwSP51sR7JXv3fxoHhfS03u65893IIjm8ct/tHwBBM76q1ln4TIMIUWFgFFDjoUwWbve8nXBpF0iwVJk93Owde19tDfaLj0cbCVIjkTHbTi9z9N68vBZbGzZLDKDZB6C72/4WOD7JhQ51jBkrufNCQTIagGC5OF7/EMdJRgQ9rNUVw== stein@mac-stimori.local"
[ $(grep stein@mac-stimori.local ~vagrant/.ssh/authorized_keys | wc -l) -eq 1 ] && echo "Public keys for steinim exists allready for vagrant." || sudo echo ${steinims_key} >> ~vagrant/.ssh/authorized_keys
sudo cp ~vagrant/.ssh/authorized_keys ~root/.ssh/authorized_keys
echo "Installed .ssh files for root client."

