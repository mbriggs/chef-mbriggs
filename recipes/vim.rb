git "~/.vim" do
  repository "https://github.com/mbriggs/.vim"
  destination "/home/#{node['mbriggs']['user']}/.vim"
  action :sync
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end

execute "install vim" do
  cwd "/home/#{node['mbriggs']['user']}/.vim"
  command "make install"
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end
