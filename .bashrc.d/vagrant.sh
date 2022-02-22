#!/bin/bash

# Use vagrant container on RHEL8
if [ "${PLATFORM_ID}" == "platform:el8" ]; then

    vagrant(){
      podman run -it --rm \
        -e LIBVIRT_DEFAULT_URI \
        -v /var/run/libvirt/:/var/run/libvirt/ \
        -v ~/.vagrant.d/boxes:/vagrant/boxes \
        -v ~/.vagrant.d/data:/vagrant/data \
        -v ~/.vagrant.d/tmp:/vagrant/tmp \
        -v $(realpath "${PWD}"):${PWD} \
        -w $(realpath "${PWD}") \
        --network host \
        --entrypoint /bin/bash \
        --security-opt label=disable \
        docker.io/vagrantlibvirt/vagrant-libvirt:latest \
          vagrant $@
    }

fi
