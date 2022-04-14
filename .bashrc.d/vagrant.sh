#!/bin/bash

# Use vagrant container on RHEL8
if [ "${PLATFORM_ID}" == "platform:el8" ]; then

    vagrant-libvirt(){
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

    vagrant(){
        podman run -it --rm \
            -e LIBVIRT_DEFAULT_URI \
            -v /var/run/libvirt/:/var/run/libvirt/ \
            -v ~/.vagrant.d/boxes:/vagrant/boxes \
            -v ~/.vagrant.d/data:/vagrant/data \
            -v ~/.vagrant.d/tmp:/vagrant/tmp \
            -v $(realpath "${PWD}"):${PWD} \
            -v "${HOME}:${HOME}" \
            -w $(realpath "${PWD}") \
            --network host \
            --entrypoint /bin/bash \
            --security-opt label=disable \
            --expose=8000-8900 \
            ${PODMAN_OPTS} \
            localhost/vagrant-extras \
            vagrant $@
    }

fi
