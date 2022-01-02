## Recipe: default_test.rb

# Call in the default profile created when importing the first distro
profile = node['cobbler3']['install']['distros'][0]

# Create test system object in Cobbler
execute 'create test system' do
  command "cobbler system add --name=test-system1 --profile=#{profile} --interface=eth0 --mac=00:11:22:AA:BB:CC --ip-address=192.168.1.6 --netmask=255.255.0.0 --static=1 --dns-name=test.mydomain.com --gateway=192.168.1.1 --hostname=test.mydomain.com"
  not_if 'cobbler system report | grep -i test-system1'
  notifies :run, 'execute[cobbler sync]', :immediately
end

execute 'cobbler sync' do
  command 'cobbler sync'
  action :nothing
end
