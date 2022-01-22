cobbler3
================

Installs and configures the latest version of Cobbler 3.x.x available in EPEL

## Supported Platforms
- CentOS 8 Stream
- CentOS 8

## Recipes
- recipe[cobbler3::default] (calls other recipes in a specific order)
- recipe[cobbler3::install] (installation tasks, largly handling packages)
- recipe[cobbler3::configure] (cobbler configuration tasks including config files, services, ISO retrieval and mounts, and cobbler commands)
- recipe[cobbler3_test::default] (used for Kitchen testing - creates various scenarios such as adding a system to cobbler)

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td>['cobbler3']['install']['dnf_modules']</td>
    <td>Array</td>
    <td>List of DNF modules needed to install software packages</td>
    <td>cobbler, python36</td>
  </tr>
  <tr>
    <td>['cobbler3']['install']['supporting_packages']</td>
    <td>Array</td>
    <td>List of all supporting packages excluding cobbler itself</td>
    <td>See attributes/default.rb</td>
  </tr>
  <tr>
    <td>['cobbler3']['configure']['distros']</td>
    <td>Array of arrays</td>
    <td>Contains list of distros, each with the ISO filename and download link </td>
    <td>See attributes/default.rb</td>
  </tr>
  <tr>
    <td>['cobbler']['configure']['root_password']</td>
    <td>String</td>
    <td>Root password for Kickstart templates. Created using `openssl passwd -1`</td>
    <td>'$1$bfI7WLZz$PxXetL97LkScqJFxnW7KS1'</td>
  </tr>
  <tr>
    <td>['cobbler3']['configure']['distros']</td>
    <td>String</td>
    <td>Add an array in this nested "array of arrays" with the distro iso filename, link to download it, and a Cobbler recognized arch (i.e. x86_64)</td>
    <td>See attributes/default.rb</td>
  </tr>
  <tr>
    <td>['cobbler']['configure']['dns_ip']</td>
    <td>String</td>
    <td>Primary DNS server used by the node running Cobbler</td>
    <td>172.18.0.1</td>
  </tr>
  <tr>
    <td>['cobbler']['configure']['dhcp_range_start']</td>
    <td>String</td>
    <td>Beginning IP address in DHCP range</td>
    <td>172.18.0.2</td>
  </tr>
  <tr>
    <td>['cobbler']['configure']['dhcp_range_end']</td>
    <td>String</td>
    <td>Last IP address used in DHCP range</td>
    <td>172.18.0.10</td>
  </tr>
  <tr>
    <td><tt>['cobbler']['configure']['dhcp_range_end']</tt></td>
    <td>String</td>
    <td>Last IP address used in DHCP range</td>
    <td>172.18.0.10</td>
  </tr>
  <tr>
    <td>['cobbler3']['configure']['netmask']</td>
    <td>String</td>
    <td>Subnet mask used in dhcp.template.erb</td>
    <td>Automatically defined using Ohai attributes</td>
  </tr>  
    <td>['cobbler3']['configure']['netid']</td>
    <td>String</td>
    <td>Subnet ID used in dhcp.template.erb</td>
    <td>Automatically defined using Ohai attributes</td>
  </tr>    
</table>

## Usage

### cobbler::default

Include `cobbler3::default` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[cobbler3::default]"
  ]
}
```

## To-do
 - Write CONTRIBUTING.md file. Include info on testing cookbook changes
 - Add profile/kickstart template management functionality
 - Include adding profile in the cobbler_test fixture cookbook to expand testing scenarios
 - Write Inspec tests for integration testing
 - Make the template "settings.yaml.erb" more easily customizable by using attributes for most Cobbler settings
 - Add Oracle Linux 8 support
 - Add SUSE Linux support
 - Upload cookbook to Chef Supermarket
 - Add CI functionality to this repo (if possible)
