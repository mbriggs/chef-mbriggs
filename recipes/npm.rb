node['mbriggs']['npm'].each do |package|
  execute("install #{package}") { command "sudo npm update -g #{package}" }
end
