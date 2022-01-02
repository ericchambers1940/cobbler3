## recipe: install.rb
# Cobbler exists in extra packages for enterprise linux 8
package 'epel-release' do
  action :install
end

# dnf modules are required to install cobbler packages
node['cobbler3']['install']['dnf_modules'].each do |mod|
  execute 'Enable dnf modules' do
    command "dnf module enable '#{mod}' -y"
    not_if 'rpm -qa | grep -i cobbler'
  end
end

# ensure all supporting packages are installed
node['cobbler3']['install']['supporting_packages'].each do |pkg|
  package pkg do
    action :install
  end
end

# lastly, install cobbler
package 'cobbler' do
  action :install
end

## Retrieve, mount, and persist ISO images
node['cobbler3']['install']['distros'].each do |name, link|
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
end
