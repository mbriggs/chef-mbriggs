git "~/dotfiles" do
  repository "https://github.com/mbriggs/dotfiles"
  destination File.expand_path("~/dotfiles")
  action :sync
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end
