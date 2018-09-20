# chef_deploy

## Description

Deploy a test application with an NGINX vhost configuration. This cookbook is for demonstration purposes only and is not intended for use. Unless you just like seeing your servers IP.

## Recipes

- nginx_config
```
Used to configure the virtual host within nginx. The server_name is configured as test.example.com
This recipe also searches for all nodes in the test_app Chef role to build a list of other servers
to check. There is no sanity check for count, if one server comes back with 200 OK it will restart
NGINX. 
```
- app_deploy
```
Deploy the application from master branch of the git repo
```

### Log of chef-client
- chef.out
