# Script to download the vagrant box and update the source_path for CentOS-7 virtualbox boxes

require 'json'

# Download the vagrant box, this will take a while the first time
# It also assumes you have vagrant installed and working
%x(vagrant box add centos/7 --provider virtualbox)

puts 'regenerating config files'
# Find the box
box = Dir.glob(File.expand_path('~/.vagrant.d/boxes/centos-VAGRANTSLASH-7/*/virtualbox/box.ovf'))[0]

# Load the packer configs
packer_configs = Dir.glob('*.json')

# Rewrite the virtualbox-ovf builder in all packer files with the correct path
packer_configs.each do |p|
  data = JSON.parse(File.read(p))
  data['builders'].each do |b|
    if b['type'] == 'virtualbox-ovf'
      b['source_path'] = box
    end
  end
  File.write(p, JSON.pretty_generate(data))
end