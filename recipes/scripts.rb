git "~/scripts" do
  repository "https://github.com/mbriggs/scripts"
  destination File.expand_path("~/scripts")
  action :sync
  user node['mbriggs']['user']
end
