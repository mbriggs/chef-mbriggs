unless File.directory?(File.expand_path '~/.rbenv')
  git 'checkout rbenv' do
    repository 'https://github.com/sstephenson/rbenv.git'
    destination File.expand_path("~#{node['mbriggs']['user']}/.rbenv")
    user node['mbriggs']['user']
  end
end

directory 'plugins' do
  path File.expand_path("~#{node['mbriggs']['user']}/.rbenv/plugins")
  action :create
end

git "install ruby-build" do
  repository "http://github.com/sstephenson/ruby-build.git"
  user node['mbriggs']['user']
  destination File.expand_path("~#{node['mbriggs']['user']}/.rbenv/plugins/ruby-build")
end

node['mbriggs']['rbenv']['plugins'].each do |plugin|
  git "install #{plugin['name']}" do
    repository "http://github.com/#{plugin['gh']}.git"
    user node['mbriggs']['user']
    destination File.expand_path("~#{node['mbriggs']['user']}/.rbenv/plugins/#{plugin['name']}")
  end
end

execute "add to path" do
  command 'export PATH="$HOME/.rbenv/bin:$PATH"'
end

execute "init" do
  command 'eval "$(rbenv init -)"'
end

node['mbriggs']['rbenv']['rubies'].each do |ruby|
  next if File.directory?(File.expand_path "~#{node['mbriggs']['user']}/.rbenv/versions/#{ruby}")

  execute "install ruby - #{ruby}" do
    command "~#{node['mbriggs']['user']}/.rbenv/bin/rbenv install #{ruby}"
  end
end
