cobbler3
================

Installs and configures the latest version of Cobbler 3.x.x

## Supported Platforms
- CentOS 8 Stream
- CentOS 8

## Recipes
- recipe[cobbler3::default] (calls other recipes in a specific order)
- recipe[cobbler3::install] (installation tasks, largly handling packages)
- recipe[cobbler3::configure] (cobbler configuration tasks including config files, services, ISO retrieval and mounts, and cobbler commands)
- recipe[cobbler3_test::default] (only used during kitchen testing. Creates a test system)

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
    <td>[[ 'CentOS-8.5.2111-x86_64-boot.iso', 'http://mirror.facebook.net/centos/8.5.2111/isos/x86_64/CentOS-8.5.2111-x86_64-boot.iso' ]]</td>
  </tr>
  <tr>
    <td>['cobbler']['configure']['dns_ip']</td>
    <td>String</td>
    <td>Primary DNS server used by the node running Cobbler</td>
    <td>192.168.1.1</td>
  </tr>
  <tr>
    <td><tt>['cobbler']['configure']['dhcp_range_start']</tt></td>
    <td>String</td>
    <td>Beginning IP address in DHCP range</td>
    <td><tt>192.168.1.5</tt></td>
  </tr>
  <tr>
    <td><tt>['cobbler']['configure']['dhcp_range_end']</tt></td>
    <td>String</td>
    <td>Last IP address used in DHCP range</td>
    <td><tt>192.168.1.10</tt></td>
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
