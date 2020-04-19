#!/bin/bash

BOXES=`/tmp/exec/vagrant status | grep libvirt | awk '{ print $1 }'`

for box in $BOXES; do
    /tmp/exec/vagrant destroy -f $box
    echo "vagrant-libvirt distro test for $box - `date`" > $box.log
    /tmp/exec/vagrant up --provider=libvirt $box 2>&1 | tee -a $box.log
    /tmp/exec/vagrant halt 
done
