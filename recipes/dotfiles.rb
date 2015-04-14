git "~/dotfiles" do
  repository "https://github.com/mbriggs/dotfiles"
  destination "/home/#{node['mbriggs']['user']}/dotfiles"
  action :sync
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end

if File.exists? "~/scripts/link-dotfiles"
  execute "link" do
    command "/home/#{node['mbriggs']['user']}/scripts/link-dotfiles"
    user node['mbriggs']['user']
    group node['mbriggs']['group']
  end
end
