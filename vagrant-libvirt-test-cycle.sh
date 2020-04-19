#!/bin/bash

BOXES=`vagrant status | grep libvirt | awk '{ print $1 }'`

for box in $BOXES; do
    sudo vagrant destroy --provider=libvirt -f $box
    echo "vagrant-libvirt distro test for $box - `date`" > $box.log
    sudo vagrant up --provider=libvirt $box 2>&1 | tee -a $box.log
    sudo vagrant halt --provider=libvirt
done
