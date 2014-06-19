Mojo Images
===========
Contained herein are [packer](http://www.packer.io/) templates for building and maintaining virtual machine images for Amazon AWS, DigitalOcean, and Vagrant (both VMWare and VirtualBox). The goal is to promote consistency between development, staging, and production environments. This philosophy helps us to catch bugs earlier and avoid issues that would otherwise only arise in a production environment. This lets me get more sleep.


##Features
- debian wheezy 7.5 x64
- systemd
- 3.2, 3.12, and 3.14 kernels

##Downloads

Vagrant boxes:

- [VirtualBox 4.3.10 (linux kernel 3.2)](http://mojo-boxes.s3.amazonaws.com/mojo-debian-7.5-3.2-0.5-virtualbox.box)
- [VirtualBox 4.3.10 (linux kernel 3.12)](http://mojo-boxes.s3.amazonaws.com/mojo-debian-7.5-3.12-0.5-virtualbox.box)
- [VirtualBox 4.3.10 (linux kernel 3.14)](http://mojo-boxes.s3.amazonaws.com/mojo-debian-7.5-3.14-0.5-virtualbox.box)
- [VMWare 6.0.3 (linux kernel 3.2)](http://mojo-boxes.s3.amazonaws.com/mojo-debian-7.5-3.2-0.5-vmware.box)
- [VMWare 6.0.3 (linux kernel 3.12)](http://mojo-boxes.s3.amazonaws.com/mojo-debian-7.5-3.12-0.5-vmware.box)
- [VMWare 6.0.3 (linux kernel 3.14)](http://mojo-boxes.s3.amazonaws.com/mojo-debian-7.5-3.14-0.5-vmware.box)

##Building

The easiest way to build is with the included ```build``` script. Run ```./build -h``` for help:


    usage: build [options]

    options:
          -h  --help              display this message
          -v  --version           display version
          -p  --template=<name>   set template (aws, vagrant, or digitalocean)
          -s  --source=<id>       set source id (defined in build.json)
          -k  --kernel=<version>  set kernel version
          -p  --provider=<name>   set vagrant provider (vmware or virtualbox)
              --dry-run           process arguments, but don't build anything

    dependencies: jq, vmware fusion, virtualbox

Configuration for each template type are in the included ```build.json```.


###Amazon AWS
Set your Amazon AWS access key and secret key:

	export AWS_ACCESS_KEY='YOUR_ACCESS_KEY'
	export AWS_SECRET_KEY='YOUR_SECRET_KEY'

To build a the default AMI (currently paravirtualized debian 7.5 with the 3.14 kernel):

	./build --template=aws

To build a specific kernel version, from a specific AMI (defined in ```build.json```):
	
	./build --template=aws --kernel=3.2 --source=debian-7.5-hvm

###DigitalOcean

Set your DigitalOcean API client ID and API key:

	export DIGITALOCEAN_CLIENT_ID='YOUR_CLIENT_ID'
	export DIGITALOCEAN_API_KEY='YOUR_API_KEY'

And then run:

	./build --template=do

###Vagrant
Install VMWare fusion and/or VirtualBox. To build a VirtualBox box:
	
	./build --template=vagrant

To build a VMWare box:

	./build --template=vagrant --provider=vmware-iso

To add a box to vagrant:

	vagrant box add mojo-debian PATH_TO_BOX

##Known Issues
- Building the VMWare box hangs. It will eventually work, but it takes 30+ minutes to acquire an IP address.
- Building the DigitalOcean images require manually power cycling the box after the kernel has been updated, or else cleanup tasks will never run.
- As an artifact of the kexec hack, DigitalOcean images can take a while to boot.