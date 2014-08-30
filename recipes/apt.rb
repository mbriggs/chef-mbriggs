execute "install apt packages" do
  command "sudo apt-get install -y #{node['mbriggs']['apt'].join ' '}"
end
