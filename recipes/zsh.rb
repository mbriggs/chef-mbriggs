git "~/.zsh" do
  repository "https://github.com/mbriggs/.zsh"
  destination File.expand_path("~/.zsh")
  action :sync
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end

execute "install zsh" do
  cwd File.expand_path("~/.zsh")
  command "make install"
end
