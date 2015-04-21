git "~/dotfiles" do
  repository "https://github.com/mbriggs/dotfiles"
  checkout_branch 'master'
  destination "/home/#{node['mbriggs']['user']}/dotfiles"
  action :sync
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end

if File.exists? "/home/#{node['mbriggs']['user']}/scripts/link-dotfiles"
  execute "link" do
    command "/home/#{node['mbriggs']['user']}/scripts/link-dotfiles"
    user node['mbriggs']['user']
    group node['mbriggs']['group']
  end
end
