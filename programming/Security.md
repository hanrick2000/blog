### Certificate
#### CSR(Certificate Signing Request)

#### Create a keypair
```bash
keytool -genkeypair -keystore keystore.p12 -storetype PKCS12 
-alias ${THE_ALIAS} -keyalg RSA -keysize 2048 
-dname "CN=${THE_CN}" -storepass ${THE_PASSWORD}

#### Create a Certificate Signing Request
keytool -certreq -keystore keystore.p12 -storetype PKCS12 
-alias ${THE_ALIAS} -sigalg SHA256withRSA -storepass ${THE_PASSWORD}

#### Install the downloaded certificate.chain.pem to the keystore
keytool -import -keystore keystore.p12 -alias ${THE_ALIAS} 
-trustcacerts -file the.chain.pem -storepass ${THE_PASSWORD}

##### Extract private key
openssl pkcs12 -nocerts -in keystore.p12 -out the_private.key -nodes

##### Convert the pem to PKCS12 Keystore
openssl pkcs12 -export -in the.chain.pem -out keystore.p12 
-inkey the_private.key -name ${THE_ALIAS} -noiter -nomaciter
```
#### Concepts
##### [alias](https://security.stackexchange.com/questions/123944/what-is-the-purpose-role-of-the-alias-attribute-in-java-keystore-files)
- unique string to identify the key entry

##### [trustStore vs keyStore](https://www.artima.com/forums/flat.jsp?forum=121&thread=347900)
- Keystore is used by a server to store private keys, and truststore is used by third party client to store public keys provided by server to access. 


##### [Add client certificate in chrome/mac](https://support.globalsign.com/customer/portal/articles/1214936-install-pkcs-12-file---mac-osx-for-safari-chrome)
- "Keychain Access" -> choose "My Certificates" -> File -> Import Items
