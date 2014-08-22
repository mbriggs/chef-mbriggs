unless File.directory?(File.expand_path '~/.rbenv')
  git 'checkout rbenv' do
    repository 'https://github.com/sstephenson/rbenv.git'
    destination File.expand_path('~/.rbenv')
  end
end

directory 'plugins' do
  path File.expand_path('~/.rbenv/plugins')
  action :create
end

git "install ruby-build" do
  repository "http://github.com/sstephenson/ruby-build.git"
  destination File.expand_path("~/.rbenv/plugins/ruby-build")
end

node['mbriggs']['rbenv']['plugins'].each do |plugin|
  git "install #{plugin['name']}" do
    repository "http://github.com/#{plugin['gh']}.git"
    destination File.expand_path("~/.rbenv/plugins/#{plugin['name']}")
  end
end

execute 'permissions' do
  command "sudo chown -R #{ENV['USER']}:staff ~/.rbenv"
end

execute "add to path" do
  command 'export PATH="$HOME/.rbenv/bin:$PATH"'
end

execute "init" do
  command 'eval "$(rbenv init -)"'
end

node['mbriggs']['rbenv']['rubies'].each do |ruby|
  next if File.directory?(File.expand_path "~/.rbenv/versions/#{ruby}")

  execute "install ruby - #{ruby}" do
    command "~/.rbenv/bin/rbenv install #{ruby}"
  end
end

execute 'permissions' do
  command "sudo chown -R #{ENV['USER']}:staff ~/.rbenv"
end
