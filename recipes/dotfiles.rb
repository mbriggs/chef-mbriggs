git "~/dotfiles" do
  repository "https://github.com/mbriggs/dotfiles"
  destination File.expand_path("~/dotfiles")
  action :sync
end
