node['mbriggs']['npm'].each do |package|
  execute("install #{package}") { command "sudo npm install -g #{package}" }
end
