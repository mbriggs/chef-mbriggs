git 'checkout rbenv' do
  repository 'https://github.com/sstephenson/rbenv.git'
  destination '~/.rbenv'
end

node['mbriggs']['rbenv']['plugins'].each do |plugin|
  git "install #{plugin['name']}" do
    repository "http://github.com/#{plugin['gh']}.git"
    destination "~/.rbenv/plugins/#{plugin['name']}"
  end
end

node['mbriggs']['rbenv']['rubies'].each do |ruby|
  execute "install ruby - #{ruby}" do
    command "rbenv install #{ruby}"
  end
end
