Vagrant.configure('2') do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  config.vm.hostname = 'dev250'
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.synced_folder "~/Projects/rails-arttwo50-staging", "/home/vagrant/art250"

  config.vm.provider "virtualbox" do |vb|
    vb.name = 'dev250'
    vb.memory = 1024
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.json = {
      "postgresql" => {
        "config" => { "ssl" => false },
        "enable_pgdg_apt" => true,
        "version" => "9.2",
        "password" => { "postgres" => "" },
        "pg_hba" => [
          {:type => 'local', :db => 'all', :user => 'postgres', :addr => nil, :method => 'ident'},
          {:type => 'local', :db => 'all', :user => 'all', :addr => nil, :method => 'ident'},
          {:type => 'host', :db => 'all', :user => 'all', :addr => '127.0.0.1/32', :method => 'trust'},
          {:type => 'host', :db => 'all', :user => 'all', :addr => '::1/128', :method => 'trust'}
        ]
      },
      "rails" => {
        "dir" => "/home/vagrant/art250"
      }
    }
    chef.add_recipe "apt"
    chef.add_recipe "openssl"
    chef.add_recipe "postgresql"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "rails"
  end
end
