Mojo Images 
===========
Contained herein are [packer](http://www.packer.io/) templates for building and maintaining virtual machine images for Amazon AWS, DigitalOcean, and Vagrant (both VMWare and VirtualBox). The goal is to promote consistency between development, staging, and production environments. This philosophy helps us to catch bugs earlier and avoid issues that would otherwise only arise in a production environment. This lets me get more sleep.


##Features
- Debian Wheezy 7.4
- Backported 3.13 kernel
- Backported systemd

##Downloads

Vagrant boxes:

- [VMWare](http://mojo-boxes.s3.amazonaws.com/mojo-debian-vagrant-vmware-201404281607.box)
- [VirtualBox](http://mojo-boxes.s3.amazonaws.com/mojo-debian-vagrant-virtualbox-201404281607.box)

##Building

###Amazon AWS
Set your Amazon AWS access key and secret key:

	export AWS_ACCESS_KEY='YOUR_ACCESS_KEY'
	export AWS_SECRET_KEY='YOUR_SECRET_KEY'

And then run:

	packer build amazon_aws/templates.json

###DigitalOcean

Set your DigitalOcean API client ID and API key:

	export DIGITALOCEAN_CLIENT_ID='YOUR_CLIENT_ID'
	export DIGITALOCEAN_API_KEY='YOUR_API_KEY'

And then run:

	packer build digitalocean/templates.json
	
###Vagrant
Install VMWare fusion and/or VirtualBox. To build both VMWare and VirtualBox boxes:

	packer build vagrant/templates.json

To only build VMWare:

	packer build -only=vmware-iso vagrant/templates.json
	
To only build VirtualBox:

	packer build -only=virtualbox-iso vagrant/templates.json
	
To add a box to vagrant:

	vagrant box add mojo-debian PATH_TO_BOX
