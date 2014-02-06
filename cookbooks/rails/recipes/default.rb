package "curl"
package "git"

execute "rvm install" do
  command "su vagrant -c 'curl -L https://get.rvm.io | bash -s stable --ruby=1.9.3'"
  creates "/home/vagrant/.rvm"
end

execute "psql create superuser role" do
  command "su postgres -c 'echo \"create role vagrant superuser login createdb;\" | psql'"
end

execute "psql template1 to UTF8" do
  user "postgres"
  command <<-SQL
  echo "
  UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';
  DROP DATABASE template1;
  CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE' LC_CTYPE='en_US.utf8'      LC_COLLATE='en_US.utf8';
  UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';
  \\c template1
  VACUUM FREEZE;" | psql postgres -t
  SQL
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

cookbook_file "bash_profile" do
  path "/home/vagrant/.bash_profile"
  owner "vagrant"
  group "vagrant"
  mode "0600"
end
