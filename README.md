# Personal Ansible

Ansible scripts to configure personal & home servers.

## music_server.yml

    ansible-playbook -i inventory -K music_server.yml --ask-vault-pass

Configures my home music server:

* Web UI: [mothership](https://github.com/zefer/mothership)
* LCD: [flashlight](https://github.com/zefer/flashlight)
* Music player: [MPD](http://www.musicpd.org/)
* Multi-room audio: [PulseAudio](http://www.freedesktop.org/wiki/Software/PulseAudio/)

## music_client_pulse.yml

    ansible-playbook -i inventory -K music_client_pulse.yml --ask-vault-pass

Configures a home music client which plays synchronised audio from the server in
any room in the house.

## base_arch.yml

Some initial Arch Linux Raspberry Pi bootstrapping steps, to be run against a
new Arch installation on a Pi, before running subsequent plays.
