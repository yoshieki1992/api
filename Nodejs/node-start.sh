
#!/bin/bash

# npm install pm2 -g
w=/var/www

cd $w/nodejs-server-server

sudo npm install

pm2 --name nodeserver start npm -- start


