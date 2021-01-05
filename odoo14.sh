#!/bin/bash
#GALARTEC CONSULTORES

ODOOVERSION=14.0
DEPTH=1

#Libreria de Wkhtmltopdf para los distintas arquitecturas SO
wk64="https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.$(lsb_release -cs)_amd64.deb"
wk32="https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.$(lsb_release -cs)_i386.deb"

#Agregar repositorio universe y actualizar (Arregla error de descarga de librerias)