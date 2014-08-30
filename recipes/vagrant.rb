node['mbriggs']['vagrant']['plugins'].each do |plugin|
  execute "install #{plugin}" do
    command "vagrant plugin install #{plugin}"
  end
end
