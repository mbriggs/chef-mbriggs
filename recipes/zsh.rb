root =  "/home/#{node['mbriggs']['user']}/.zsh"

git root do
  repository "https://github.com/mbriggs/.zsh"
  checkout_branch 'master'
  destination root
  action :sync
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end

execute "install zsh" do
  cwd root 
  command "make install"
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end

link "/home/#{node['mbriggs']['user']}/.zshrc" do
  to "#{root}/zshrc"
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end

execute "chsh" do
  command "chsh vagrant -s /usr/bin/zsh"
end
