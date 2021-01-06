#!/bin/bash
#GALARTEC CONSULTORES

ODOOVERSION=14.0 
PATHBASE=~/Developments/odoo14
PATHREPOS=~/Developments/odoo14/extra-addons

#Libreria de Wkhtmltopdf para los distintas arquitecturas SO
wk64="https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.$(lsb_release -cs)_amd64.deb"
wk32="https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.$(lsb_release -cs)_i386.deb"

#Agregar repositorio universe y actualizar (Arregla error de descarga de librerias)
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get install -y git

# Actualizaz e instalar Postgresql
sudo apt-get install postgresql -y
sudo su - postgres -c "createuser -s $USER"

mkdir ~/Developments
mkdir $PATHBASE
mkdir $PATHREPOS
cd $PATHBASE
# Descarga de Odoo desde el repositorio oficial
git clone https://github.com/odoo/odoo.git -b $ODOOVERSION --depth 1

# Instalar python3 and dependencias para Odoo
sudo apt-get install git python3 python3-pip 
build-essential wget python3-dev python3-venv python3-wheel libxslt-dev 
libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less libpng12-0 libjpeg-dev gdebi -y
 

sudo apt-get -y install python3 python3-pip python-pip
sudo pip3 install libsass vobject qrcode num2words setuptools

# Arreglar wkhtml* dependencias Ubuntu Server 18.04
sudo apt-get -y install libxrender1

# Instalar nodejs & less
sudo apt-get install -y npm node-less
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g less


# Descarga e instala  WKHTMLTOPDF
rm $PATHBASE/wkhtmltox_0.12.5-1*.deb
rm wkhtmltox_0.12.5-1*.deb
if [ "`getconf LONG_BIT`" == "32" ];

then
	wget $wk32
	wkhtmltox_0.12.5-1.bionic_amd64.deb
else
	wget $wk64
fi

sudo dpkg -i --force-depends wkhtmltox_0.12.5-1*.deb
sudo ln -s /usr/local/bin/wkhtml* /usr/bin
#tar xvf $PATHBASE/wkhtmltox*.tar.xz
#sudo cp -r $PATHBASE/wkhtmltox/bin/* /usr/local/bin/
#sudo cp -r $PATHBASE/wkhtmltox/bin/* /usr/bin/


# instala dependencias de odoo
sudo pip3 install -r $PATHBASE/odoo/requirements.txt
sudo apt-get -f -y install
python3 $PATHBASE/odoo/odoo-bin


echo "Odoo 14 instalado correctamente Jesús Fernández"