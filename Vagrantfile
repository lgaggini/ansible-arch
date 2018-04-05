# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.vm.provision "shell", inline: "sudo pacman -Sy python2 --noconfirm"
end
