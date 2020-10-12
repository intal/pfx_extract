#!/bin/bash

filename=$1

#extract ca-certs
echo "> Extracting ca-certs..."
openssl pkcs12 -in ${filename}.pfx  -nokeys -cacerts -out ${filename}-ca.crt
echo "done!"
echo " "

# extract certificate
echo "> Extracting certificate file..."
openssl pkcs12 -in ${filename}.pfx -out ${filename}-cert.pem -clcerts -nokeys
echo "done!"
echo " "

# extract key
echo "> Extracting key file..."
openssl pkcs12 -in ${filename}.pfx -nocerts  -out ${filename}.key
echo "done!"
echo " "


# decrypt key
echo "> Decrypt key"
openssl rsa -in ${filename}.key -out ${filename}-decrypted.key

echo "done!"
echo " "
