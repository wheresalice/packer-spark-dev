# Spark

Packer/Ansible build for creating a development environment with Spark, R and Python installed.

## Docker

`packer.io build -only=docker docker.json`

This will create a docker image you can use

## Vagrant

You'll need to run load_virtualbox.rb to download the box and update the packer config file before you can use this.  The included Vagrantfile points to the same box, so you can also vagrant up and then manually change the config files if you prefer.

`packer.io build -only=virtualbox-ovf virtualbox.json`

This will actually build a Vagrant image for you to use.

## TODO

- Add impala drivers
- Merge docker and virtualbox packer configs
