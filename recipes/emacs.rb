unless File.directory?('/usr/local/Cellar/emacs')
  command('install emacs') { 'brew install emacs --cocoa' }
end

git '~/.emacs.d' do
  repository 'https://github.com/mbriggs/.emacs.d'
  destination File.expand_path('~/.emacs.d')
  action :sync
  user node['mbriggs']['user']
  group node['mbriggs']['group']
end
