# HowTo list/remove/delete SSL certificates handled by certbot.

This procedure was tested on Debian12 (2025-10-31) with "Let's Encrypt" certificates installed and maintained using `certbot` application.

Here's how you can delete a certificate: Easily by using the FQDN - Fully Qualified Domain Name - of that website, which you must know/have - since this is what the certificate is issued for:

`$ certbot delete --cert-name rim-atom.arkthis.com`

Here's how you can list all certs that certbot feels responsible for:

`$ certbot certificates`


```
Saving debug log to /var/log/letsencrypt/letsencrypt.log

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

The following certificate(s) are selected for deletion:

  * rim-atom.arkthis.com

WARNING: Before continuing, ensure that the listed certificates are not being
used by any installed server software (e.g. Apache, nginx, mail servers).
Deleting a certificate that is still being used will cause the server software
to stop working. See https://certbot.org/deleting-certs for information on
deleting certificates safely.

Are you sure you want to delete the above certificate(s)?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: y
Deleted all files relating to certificate rim-atom.arkthis.com.
root@amp:/etc/apache2/sites-available# certbot certificates
Saving debug log to /var/log/letsencrypt/letsencrypt.log

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Found the following certs:
  Certificate Name: amp.arkthis.com
    Serial Number: 5810e4c0aaa4c3679a6f10d9be22921e212
    Key Type: ECDSA
    Domains: amp.arkthis.com
    Expiry Date: 2026-01-29 11:38:32+00:00 (VALID: 89 days)
    Certificate Path: /etc/letsencrypt/live/amp.arkthis.com/fullchain.pem
    Private Key Path: /etc/letsencrypt/live/amp.arkthis.com/privkey.pem
  Certificate Name: cloud.arkthis.com
    Serial Number: 58403456a0971017b579e9a3013cf32c885
    Key Type: ECDSA
    Domains: cloud.arkthis.com
    Expiry Date: 2026-01-27 17:10:59+00:00 (VALID: 87 days)
    Certificate Path: /etc/letsencrypt/live/cloud.arkthis.com/fullchain.pem
    Private Key Path: /etc/letsencrypt/live/cloud.arkthis.com/privkey.pem
  Certificate Name: kimai.arkthis.com
    Serial Number: 6a3c525c1af7ef642dedcb40a54733829d9
    Key Type: ECDSA
    Domains: kimai.arkthis.com
    Expiry Date: 2026-01-28 13:36:08+00:00 (VALID: 88 days)
    Certificate Path: /etc/letsencrypt/live/kimai.arkthis.com/fullchain.pem
    Private Key Path: /etc/letsencrypt/live/kimai.arkthis.com/privkey.pem
  Certificate Name: www.arkthis.com
    Serial Number: 619206cd11a551535138ac5a2ccd693934b
    Key Type: ECDSA
    Domains: www.arkthis.com
    Expiry Date: 2026-01-29 18:45:32+00:00 (VALID: 89 days)
    Certificate Path: /etc/letsencrypt/live/www.arkthis.com/fullchain.pem
    Private Key Path: /etc/letsencrypt/live/www.arkthis.com/privkey.pem
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
```
