# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provider :vmware_fusion do |v|
      v.vmx["ethernet0.addressType"] = "static"
      v.vmx["ethernet0.address"] = "00:50:56:3e:86:29"
  end

  config.vm.define "mojo-debian-7.5-3.2" do |m|
    m.vm.box = "mojo-debian-7.5-3.2-0.5"
    m.vm.box_url = "http://mojo-boxes.s3.amazonaws.com/mojo-debian-7.5-3.2-0.5-virtualbox.box"
    m.vm.provider :vmware_fusion do |v, override|
      m.vm.box_url = "http://mojo-boxes.s3.amazonaws.com/mojo-debian-7.5-3.2-0.5-vmware.box"
    end
  end

  config.vm.define "mojo-debian-7.5-3.12" do |m|
    m.vm.box = "mojo-debian-7.5-3.12-0.5"
    m.vm.box_url = "http://mojo-boxes.s3.amazonaws.com/mojo-debian-7.5-3.12-0.5-virtualbox.box"
    m.vm.provider :vmware_fusion do |v, override|
      m.vm.box_url = "http://mojo-boxes.s3.amazonaws.com/mojo-debian-7.5-3.12-0.5-vmware.box"
    end
  end

  config.vm.define "mojo-debian-7.5-3.14" do |m|
    m.vm.box = "mojo-debian-7.5-3.14-0.5"
    m.vm.box_url = "http://mojo-boxes.s3.amazonaws.com/mojo-debian-7.5-3.14-0.5-virtualbox.box"
    m.vm.provider :vmware_fusion do |v, override|
      m.vm.box_url = "http://mojo-boxes.s3.amazonaws.com/mojo-debian-7.5-3.14-0.5-vmware.box"
    end
  end
end
