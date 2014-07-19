bash "install_vagrant" do
  code <<-EOH
  sudo sh -c \"echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib non-free' > /etc/apt/sources.list.d/virtualbox.list\" && sudo wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add - && sudo apt-get update && sudo apt-get install -y virtualbox dkms
  sudo wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3_x86_64.deb
  sudo dpkg -i vagrant_1.6.3_x86_64.deb
  sudo apt-get -f install
  sudo mkdir /test
  EOH
end

template "/test/Vagrantfile" do
  source "Vagrantfile.erb"
  action :create_if_missing
end

cookbook_file "bootstrap.sh" do
  path "/test/bootstrap.sh"
  action :create_if_missing
end

cookbook_file "vagrant.war" do
  path "/test/vagrant.war"
  action :create_if_missing
end

execute "vagrant up" do
cwd "/test"
end


