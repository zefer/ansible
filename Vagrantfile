# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'metrics' do |s|
    s.vm.box = 'precise32'
    s.vm.box_url = 'http://files.vagrantup.com/precise32.box'
    s.vm.network :private_network, ip: "192.168.33.20"

    s.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'ansible/metrics.yml'
      ansible.raw_arguments  = "--ask-vault-pass"
    end

    config.vm.provider 'virtualbox' do |v|
      v.customize ['modifyvm', :id, '--memory', '4096']
    end
  end

  config.vm.define 'goex_proxy' do |s|
    s.vm.box = 'precise32'
    s.vm.box_url = 'http://files.vagrantup.com/precise32.box'
    s.vm.network :private_network, ip: "192.168.33.20"

    s.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'ansible/goex_proxy.yml'
      ansible.raw_arguments  = "--ask-vault-pass"
    end

    config.vm.provider 'virtualbox' do |v|
      v.customize ['modifyvm', :id, '--memory', '4096']
    end
  end

  config.vm.define 'mpd' do |s|
    s.vm.box = 'precise32'
    s.vm.box_url = 'http://files.vagrantup.com/precise32.box'
    s.vm.network :private_network, ip: "192.168.33.20"
    s.vm.network :forwarded_port, guest: 6600, host: 6600
    s.vm.network :forwarded_port, guest: 55555, host: 55555
    s.vm.synced_folder "/Users/joe/music", "/music",
      owner: "root", group: "root",
      mount_options: ["dmode=777,fmode=777"]

    s.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'personal-ansible/mpd_vagrant.yml'
      ansible.inventory_path = 'vagrant-ansible-inventory'
    end

    config.vm.provider 'virtualbox' do |v|
      v.customize ['modifyvm', :id, '--memory', '2048']
    end
  end
end
