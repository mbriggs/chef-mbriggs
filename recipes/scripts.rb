git "~/scripts" do
  repository "https://github.com/mbriggs/scripts"
  checkout_branch 'master'
  destination "/home/#{node['mbriggs']['user']}/scripts"
  action :sync
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end
