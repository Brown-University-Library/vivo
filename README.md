###Brown University Libraries

Modifications to VIVO.  

Configured with the [VIVO three tiered build method](https://wiki.duraspace.org/display/VIVO/Building+VIVO+in+3+tiers).   

####Install
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
