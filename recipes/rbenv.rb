u = node['mbriggs']['user']
g = node['mbriggs']['group']

unless File.directory?(File.expand_path '~/.rbenv')
  git 'checkout rbenv' do
    repository 'https://github.com/sstephenson/rbenv.git'
    destination File.expand_path("~#{u}/.rbenv")
    user u
    group g
  end
end

directory 'plugins' do
  path File.expand_path("~#{u}/.rbenv/plugins")
  action :create
  user u
  group g
end

git "install ruby-build" do
  repository "http://github.com/sstephenson/ruby-build.git"
  user u
  group g
  destination File.expand_path("~#{u}/.rbenv/plugins/ruby-build")
end

node['mbriggs']['rbenv']['plugins'].each do |plugin|
  git "install #{plugin['name']}" do
    repository "http://github.com/#{plugin['gh']}.git"
    user u
    group g
    destination File.expand_path("~#{u}/.rbenv/plugins/#{plugin['name']}")
  end
end

node['mbriggs']['rbenv']['default-gems'].each do |gem|
  execute "add default gem #{gem}" do
    command "echo \"#{gem}\" >> ~#{u}/.rbenv/default-gems"
    user u
    group g
  end
end

node['mbriggs']['rbenv']['rubies'].each do |ruby|
  next if File.directory?(File.expand_path "~#{u}/.rbenv/versions/#{ruby}")

  execute "install ruby - #{ruby}" do
    command "~#{u}/.rbenv/bin/rbenv install #{ruby}"
    user u
    group g
  end

  if node['mbriggs']['rbenv']['global'] == ruby 
    execute "set global to #{ruby}" do
      command "~#{u}/.rbenv/bin/rbenv global #{ruby}"
      user u
      group g
    end
  end
end
