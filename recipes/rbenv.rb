return if File.directory?(File.expand_path '~/.rbenv')

git 'checkout rbenv' do
  repository 'https://github.com/sstephenson/rbenv.git'
  destination File.expand_path('~/.rbenv')
end

directory 'plugins' do
  path File.expand_path('~/.rbenv/plugins')
  action :create
end

node['mbriggs']['rbenv']['plugins'].each do |plugin|
  git "install #{plugin['name']}" do
    repository "http://github.com/#{plugin['gh']}.git"
    destination File.expand_path("~/.rbenv/plugins/#{plugin['name']}")
  end
end

execute 'permissions' do
  command "chown -R #{ENV['USER']}:staff ~/.rbenv"
end

execute "add to path" do
  command 'export PATH="$HOME/.rbenv/bin:$PATH"'
end

execute "init" do
  command 'eval "$(rbenv init -)"'
end

node['mbriggs']['rbenv']['rubies'].each do |ruby|
  execute "install ruby - #{ruby}" do
    command "~/.rbenv/bin/rbenv install #{ruby}"
  end
end

execute 'permissions' do
  command "chown -R #{ENV['USER']}:staff ~/.rbenv"
end
