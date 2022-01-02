## Attributes file: default.rb

## Variables used to build other attribute values
primary_nic = node['network']['default_interface']
primary_ip = node['ipaddress']

## General attributes used in the install.rb recipe
# Supporting packages cobbler 3.x.x needs to run
default['cobbler3']['install']['supporting_packages'] = %w(
  createrepo_c
  httpd
  xorriso
  python3-mod_wsgi
  mod_ssl
  python3-cheetah
  python3-netaddr
  python3-librepo
  python3-schema
  python3-yaml
  rsync
  syslinux
  tftp-server
  dhcp-server
)

# Array of dnf modules to be enabled
default['cobbler3']['install']['dnf_modules'] = %w(
  cobbler
  python36
)

# To add another distro, simply append an array nested inside this attribute with two values: the acutal file name of the iso image, the link to download it's iso file, and the architecture.
default['cobbler3']['configure']['distros'] = [
  [ 'CentOS-8.5.2111-x86_64-boot.iso', 'http://mirror.facebook.net/centos/8.5.2111/isos/x86_64/CentOS-8.5.2111-x86_64-boot.iso', 'x86_64 ],
]

default['cobbler3']['configure']['services'] = [
  'tftpd',
  'httpd',
  'dhcpd',
  'cobblerd'
]

## dhcp.template.erb attributes
# Enter in the primary DNS ip address your cobbler node will have
default['cobbler3']['configure']['dns_ip'] = '192.168.1.1'

# Subnet mask of the primary network interface
default['cobbler3']['configure']['netmask'] = node['network']['interfaces']["#{primary_nic}"]['addresses']["#{primary_ip}"]['netmask']

# network id (identifies a subnet) used by dhcp.template.erb. The var "netid" accesses the second network route discovered by ohai which USUALLY is the desired
# This accesses the second network route discovered by ohai which USUALLY is the desired subnet used to build our network id
default['cobbler3']['configure']['netid'] = node['network']['interfaces']["#{primary_nic}"]['routes'][1]['destination'].sub(%r{/..}, '') # cuts out the CIDR notation at the end (i.e. /24)

# Beginning and end of the dhcp range
default['cobbler3']['configure']['dhcp_range_start'] = '192.168.1.5'
default['cobbler3']['configure']['dhcp_range_end'] = '192.168.1.10'
