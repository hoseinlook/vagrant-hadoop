Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.define "hadoop-master" do |config|
    config.vm.network :private_network, ip:"10.20.30.11"
    config.vm.hostname = "hadoop-master"
    config.vm.provision :shell, path: "scripts/1_download_and_install_hadoop.sh"
    config.vm.provision :shell, path: "scripts/2_run_master.sh"
  end

  (1..2).each do |i|
    config.vm.define "hadoop-worker#{i}" do |config|
      config.vm.network :private_network, ip:"10.20.30.2#{i}"
      config.vm.hostname = "hadoop-worker#{i}"
      config.vm.provision :shell, path: "scripts/1_download_and_install_hadoop.sh"
      config.vm.provision :shell, path: "scripts/3_run_worker.sh"
    end
  end

end
