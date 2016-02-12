# Spark

Packer/Ansible build for creating a development environment with Spark, R and Python installed.

## Docker

`packer.io build -only=docker docker.json`

This will create a docker image you can use

## Vagrant

You'll need to run vagrant up and probably change the source_path in the json config before you can run this.

`packer.io build -only=virtualbox-ovf virtualbox.json`

This will actually build a Vagrant image for you to use.

## TODO

- Add impala drivers
- Merge docker and virtualbox packer configs
