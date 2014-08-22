###Brown University Libraries

Modifications to VIVO for Brown University's [VIVO implementation](http://vivo.brown.edu/).  

Configured with the [VIVO three tiered build method](https://wiki.duraspace.org/display/VIVO/Building+VIVO+in+3+tiers).   

####Install

~~~
$ git clone https://github.com/Brown-University-Library/vivo.git brown-vivo
$ cd brown-vivo
$ git submodule init
#Pull in VIVO and Vitro.  This will take a few minutes.
$ git submodule update
#Check out specific versions of VIVO and Vitro
$cd VIVO
$git checkout maint-rel-1.5
$cd ../Vitro
$git checkout maint-rel-1.5
#Change back to vivo main directory
$cd ..
#Copy default deploy.properties and edit
$cp default.deploy.properties deploy.properties
#Adjust deploy.properties
#Create the data directory specified in deploy.properties if it doesn't exist.
#Build and deploy VIVO
$ ant all
~~~

####Database

VIVO requires a MySQL database.  Log in to mysql and enter:
~~~
mysql> create database vivo character set 'utf8';
~~~
