# Let's Encrypt "Certbot" failed to auto-renew SSL certificate: "Missing virtual host on port 80"

## PROBLEM

The auto-update of an SSL certificate on one of our servers failed.
When running certbot manually, it said it couldn't without Apache also listening on port 80 on that machine:

`$ sudo certbot --dry-run renew`

```
Saving debug log to /var/log/letsencrypt/letsencrypt.log

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Processing /etc/letsencrypt/renewal/subdomainXY.arkthis.com.conf
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Simulating renewal of an existing certificate for subdomainXY.arkthis.com
Failed to renew certificate subdomainXY.arkthis.com with error: Unable to find a virtual host listening on port 80 which is currently needed for Certbot to prove to the CA that you control your domain. Please add a virtual host for port 80.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
All simulated renewals failed. The following certificates could not be renewed:
  /etc/letsencrypt/live/subdomainXY.arkthis.com/fullchain.pem (failure)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1 renew failure(s), 0 parse failure(s)
Ask for help or search for solutions at https://community.letsencrypt.org. See the logfile /var/log/letsencrypt/letsencrypt.log or re-run Certbot with -v for more details.
```

The setup is in fact so, that Apache's config is set to *only* listen on HTTPS (port 443).
Therefore the error.


## SOLUTION

Disable the "rewrite*" Lines in `/etc/apache2/sites-available/000-default.conf`:

```
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    RewriteEngine on
    #RewriteCond %{SERVER_NAME} =subdomainXY.arkthis.com
    #RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,NE,R=permanent]
</VirtualHost>
```

Then enable the site:

`$ sudo a2ensite 000-default.conf`

Then restart apache:

`$ sudo systemctl restar apache2`


Now your webserver is listening on port 80 (http) too - and certbot should happily be able to renew your SSL certificates.
