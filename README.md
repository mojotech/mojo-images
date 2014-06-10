Mojo Images
===========
Contained herein are [packer](http://www.packer.io/) templates for building and maintaining virtual machine images for Amazon AWS, DigitalOcean, and Vagrant (both VMWare and VirtualBox). The goal is to promote consistency between development, staging, and production environments. This philosophy helps us to catch bugs earlier and avoid issues that would otherwise only arise in a production environment. This lets me get more sleep.


##Features
- Debian Wheezy 7.5
- Backported 3.14 kernel
- Backported systemd

##Downloads

Vagrant boxes:

- [VMWare 6.0.3](http://mojo-boxes.s3.amazonaws.com/mojo-debian-vagrant-vmware-1400544616.box)
- [VirtualBox 4.3.10](http://mojo-boxes.s3.amazonaws.com/mojo-debian-vagrant-virtualbox-1400543559.box)

##Building

###Amazon AWS
Set your Amazon AWS access key and secret key:

	export AWS_ACCESS_KEY='YOUR_ACCESS_KEY'
	export AWS_SECRET_KEY='YOUR_SECRET_KEY'

And then run:

	packer build amazon_aws/templates.json

To build a specific kernel version, from a specific AMI (ami-86896dee is the wheezy 7.5 HVM AMI):
	
	packer build -var 'kernel_release=wheezy-backports' -var 'kernel_version=3.14-0.bpo.1-amd64' -var 'source_ami=ami-86896dee' amazon_aws/template.json

###DigitalOcean

Set your DigitalOcean API client ID and API key:

	export DIGITALOCEAN_CLIENT_ID='YOUR_CLIENT_ID'
	export DIGITALOCEAN_API_KEY='YOUR_API_KEY'

And then run:

	packer build digitalocean/template.json

###Vagrant
Install VMWare fusion and/or VirtualBox. To build both VMWare and VirtualBox boxes:

	packer build vagrant/template.json

To only build VMWare:

	packer build -only=vmware-iso vagrant/template.json

To only build VirtualBox:

	packer build -only=virtualbox-iso vagrant/template.json

To add a box to vagrant:

	vagrant box add mojo-debian PATH_TO_BOX
