git "~/scripts" do
  repository "https://github.com/mbriggs/scripts"
  enable_checkout false
  destination "/home/#{node['mbriggs']['user']}/scripts"
  action :sync
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end
