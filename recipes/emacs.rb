git "~/.emacs.d" do
  repository "https://github.com/mbriggs/.emacs.d"
  destination File.expand_path('~/.emacs.d')
  action :sync
end
