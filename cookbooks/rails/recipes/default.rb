package "curl"
package "git"

execute "install_rvm" do
  command "su vagrant -c 'curl -L https://get.rvm.io | bash -s stable --ruby=1.9.3'"
  creates "/home/vagrant/.rvm"
end

execute "create_role" do
  command "su postgres -c 'echo \"create role vagrant superuser login createdb;\" | psql'"
end

package "imagemagick"
package "libmagickwand-dev"
package "libxslt1-dev"
package "libxml2-dev"
package "nodejs"
package "redis-server"

execute "bundle_install" do
  command "su vagrant -l -c 'cd #{node["rails"]["dir"]} && bundle'"
end
