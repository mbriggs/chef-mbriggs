git "~/.vim" do
  repository "https://github.com/mbriggs/.vim"
  destination File.expand_path("~/.vim")
  action :sync
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end

execute "install vim" do
  cwd File.expand_path("~/.vim")
  command "make install"
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end
