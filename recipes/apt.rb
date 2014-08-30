execute "update" do
  command "sudo apt-get update"
end

execute "install apt packages" do
  command "DEBIAN_FRONTEND=noninteractive sudo apt-get install -y #{node['mbriggs']['apt'].join ' '}"
end
