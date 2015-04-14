git "~/.zsh" do
  repository "https://github.com/mbriggs/.zsh"
  destination "/home/#{node['mbriggs']['user']}/.zsh"
  action :sync
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end

execute "install zsh" do
  cwd "/home/#{node['mbriggs']['user']}/.zsh"
  command "make install"
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end

execute "chsh" do
  command "chsh vagrant -s /usr/bin/zsh"
end
