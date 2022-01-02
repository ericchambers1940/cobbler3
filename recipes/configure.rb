## recipe: configure.rb

# DHCP configuration template
template '/etc/cobbler/dhcp.template' do
  source 'dhcp.template.erb'
end

# Main cobbler configuration file
template '/etc/cobbler/settings.yaml' do
  source 'settings.yaml.erb'
end

node['cobbler3']['configure']['services'].each do |svc|
  service svc do
    action [ :enable, :start ]
  end
end

## Retrieve, mount, and persist ISO images
node['cobbler3']['configure']['distros'].each do |name, link, arch|
  remote_file "/opt/#{name}" do
    source link
  end

  directory "/mnt/#{name}" do
    recursive true
  end

  mount "/mnt/#{name}" do
    device "/opt/#{name}"
    fstype 'iso9660'
    options 'loop,ro'
    action [:mount, :enable]
  end

  execute 'import distro' do
    command "cobbler import --name=#{name} --arch=#{arch} --path=/mnt/#{name}"
    not_if "cobbler distro list | grep -i #{name}"
  end
end


