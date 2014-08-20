git "~/.zsh" do
  repository "https://github.com/mbriggs/.zsh"
  destination "~/.zsh"
  action :sync
end

execute "install zsh" do
  cwd "~/.zsh"
  command "make install"
end
