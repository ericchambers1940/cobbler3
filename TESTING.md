# How to test this cookbook locally
Please follow these instructions closely before submitting a PR against the master branch:
1. See CONTRIBUTING.md for info regarding what should be on your dev machine.
2. Test syntax/linting from the root of cobbler3 by running "cookstyle -a .". This will show any syntax issues and attempt to fix styling issues automatically.
3. Run "kitchen verify" from the root of cobbler3. This will converge the cookbook in a Docker container and run any Inspec integration tests.
4. If any issues appear from steps 2 and 3, fix them before submitting a PR. I only have so many minutes in GitHub Actions. 
