cobbler3
================

Installs and configures the latest version of Cobbler 3.x.x

## Supported Platforms
- CentOS 8.3.2011

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['cobbler']['root_password']</tt></td>
    <td>String</td>
    <td>Root password for Kickstart templates.</td>
    <td><tt>`echo 'root' | shasum -a 512 -p`</tt></td>
  </tr>
  <tr>
    <td><tt>['cobbler']['user']['name']</tt></td>
    <td>String</td>
    <td>UNIX username</td>
    <td><tt>cloud</tt></td>
  </tr>
  <tr>
    <td><tt>['cobbler']['user']['uid']</tt></td>
    <td>Integer</td>
    <td>UNIX uid</td>
    <td><tt>900</tt></td>
  </tr>
</table>

## Usage

### cobbler::default

Include `cobblerd` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[cobblerd::default]"
  ]
}
```
