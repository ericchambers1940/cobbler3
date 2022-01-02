## recipe: configure.rb

# DHCP configuration template
template '/etc/cobbler/dhcp.template' do
  source 'dhcp.template.erb'
end
