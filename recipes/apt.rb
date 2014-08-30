execute "update" do
  command "sudo apt-get update"
end

execute "install apt packages" do
  command "sudo DEBIAN_FRONTEND=noninteractive apt-get install -y #{node['mbriggs']['apt'].join ' '}"
end
