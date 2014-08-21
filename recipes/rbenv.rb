return if File.directory?(File.expand_path '~/.rbenv')

git 'checkout rbenv' do
  repository 'https://github.com/sstephenson/rbenv.git'
  destination File.expand_path('~/.rbenv')
end

node['mbriggs']['rbenv']['plugins'].each do |plugin|
  git "install #{plugin['name']}" do
    repository "http://github.com/#{plugin['gh']}.git"
    destination File.expand_path("~/.rbenv/plugins/#{plugin['name']}")
  end
end

node['mbriggs']['rbenv']['rubies'].each do |ruby|
  execute "install ruby - #{ruby}" do
    command "rbenv install #{ruby}"
  end
end
