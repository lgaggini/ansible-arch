# ansible-arch

ansible-arch is an Ansible playbook heavily inspired by [spark](https://github.com/pigmonkey/spark) to provision and recreate from scratch my archlinunx workstation environment.

## Status
The follow roles are done:

* archcore: performs the basic steps on a freshly archlinux install
    * hostname setting
    * user creation
    * timezone, locale and keymapping configuration
    * pacman configuration, mirror refresh, reflector install and mirror sort
    * basic packages install
    * populates home with a directories skel
* dotfiles: clones a dotfiles repo by git and install them in the home
* x: installs xorg, video driver, window manager and basic gui utilities
* tools: installs some core gui tools (browser, editor)
* mail: installs neomutt, msmtp, offlineimap, notmuch, lbdb, urlscan
* pim: installs pass, vdirsyncer, khal, todoman
* audio: installs alsa-utils, mpd, mpc, ncmpc, soundcloud-dl and creates media/audio subdirectories
* backup: installs restic, enables scheduled backups and optionally enable backup rsync on a remote host by ssh
* ops: installs ansible, ansible-lint, libvirt, wireshark, virt-mananger and puppet-lint
* virt: installs docker, qemu, virtualbox and vagrant
* dev:
    * python: installs ipython2/3, python2/3 virtualenv, python virtualenvwrapper, pelican and flake8
* communication: installs weechat, pidgin and purple-skyweb (skype plugin for pidgin)
* media: installs mpv, gnome-mpv and creates media/video subdirectories

## Plan
To come:
* to set communications account

## Install
### Clone
```bash
git clone https://github.com/lgaggini/ansible-arch
```

### Requirements

* Ansible
* Vagrant (otional, to test on a disposable vm)

## Configuration
The configuration of the playbook is done by edit the `group_vars/all` file, you can mainly edit:

* some settings for the archlinux installation customization
* dotfiles git repo location
* packages list to be installed for the various roles
* mail_account (imap and smtp) and cal account
* backup remote server for backups rsync

### Custom systemd user unit
I have all my user custom systemd units in my [dotfiles repo](https://github.com/lgaggini/dotfiles/tree/master/.config/systemd/user) and I get them in the dotfiles role and in
the other roles I enable them. They aren't included in the playbook.

## Usage
### Vagrant playground
```bash
cd ansible-arch
vagrant up
ansible-playbook -i vagrant.inventory playbook.yml
```

Every roles and every steps are tagged, you can perform partially run of playbook [using them](https://docs.ansible.com/ansible/latest/user_guide/playbooks_tags.html).

Main available tags are:

* core
* cli
* gui
* dotfiles
* tools
* mail
* pim
* audio
* backup
* ops
* virt
* dev
* comm
* media
