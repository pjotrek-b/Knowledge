# Nextcloud: "The reverse proxy header configuration is incorrect."

> Forwarded for headers:
> The reverse proxy header configuration is incorrect. This is a security issue
> and can allow an attacker to spoof their IP address as visible to the
> Nextcloud.

TODO: Add config for proxy and webserver (behind proxy, with local LAN-only IP).

Add this to the `$CONFIG` array in `nextcloud/config/config.php`:

```
'trusted_proxies' =>
  array (
      0 => '192.168.0.100',             // <- This /is/ the IP of the Apache reverse_proxy
  ),
```


Here's a copy of a working Apache2 config, for nextcloud behind a reverse-proxy (Apache, too). Running clean without /any/ warnings on the installation-check admin page.

# Copy of `/etc/apache2/sites-enabled/cloud.amp.conf` on the PROXY Apache

This reverse-proxy provides and handles SSL/certificates - and talks HTTP with
website container machines in its virtual LAN.

```
# Please adjust these values for new services/containers:
Define server_name cloud.arkthis.com
Define server_host cloud.amp

# vhost block for redirecting http entry-requests over to https URL.
<VirtualHost *:80>
	ServerName ${server_name}

	ErrorLog ${APACHE_LOG_DIR}/${server_host}-proxy-error.log
	CustomLog ${APACHE_LOG_DIR}/${server_host}-proxy-access.log combined
    #Include conf-available/arkthis-vhost-common.conf


	# This redirects all requests from HTTP (port 80) over to HTTPS (port 443):
	RewriteEngine on
	RewriteCond %{SERVER_NAME} =${server_name}
	RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,NE,R=permanent]
    #Include conf-available/arkthis-vhost-rewrite_to_https.conf
</VirtualHost>

# This is fine-tuned for NextCloud (v22.40.x) - 20251031
<IfModule mod_ssl.c>
<VirtualHost *:443>
	ServerName ${server_name}

	ErrorLog ${APACHE_LOG_DIR}/${server_host}-proxy-error.log
	CustomLog ${APACHE_LOG_DIR}/${server_host}-proxy-access.log combined
    #Include conf-available/arkthis-vhost-common.conf

	# These lines do the proxy-forwarding magic.
	ProxyPreserveHost On
	# In a typical reverse proxy or gateway configuration, this option should be set to Off.
	ProxyRequests Off
	# Yes, internally the proxy connects using HTTP (port 80):
	ProxyPass / http://${server_host}:80/
	ProxyPassReverse / http://${server_host}:80/

	# The `%2F`-problem, with slashes in web-addresses can be caused by Apache not allowing encoded
	# slashes by default. 
	# See: https://tecadmin.net/apache-allow-encoded-slashes/
	AllowEncodedSlashes NoDecode
    #Include conf-available/arkthis-vhost-rev_proxy-pass.conf

	# Enable SSL and load certificates and -stuff for ${server_name}:
	Include /etc/letsencrypt/options-ssl-apache.conf
	SSLCertificateFile /etc/letsencrypt/live/${server_name}/fullchain.pem
	SSLCertificateKeyFile /etc/letsencrypt/live/${server_name}/privkey.pem
    #Include conf-available/arkthis-le-ssl.conf

    # -----------------------------------------------
    # WebDAV related.
    # -----------------------------------------------
    # Rewrite Nextcloud (Web)DAV requests here at proxy layer already, to speed
    # things up for data-retrieval.
    # Source: https://docs.nextcloud.com/server/stable/admin_manual/configuration_server/reverse_proxy_configuration.html
    RewriteEngine On
    # TODO: Not tested yet!
    RewriteRule ^/\.well-known/carddav https://%{SERVER_NAME}/remote.php/dav/ [R=301,L]
    RewriteRule ^/\.well-known/caldav https://%{SERVER_NAME}/remote.php/dav/ [R=301,L]

    # -----------------------------------------------
    # WebSockets (ws://) service related.
    # -----------------------------------------------
    # I'm not too sure, but it's some to provide shortcut-access URLs to
    # "websocket" services provided by a nextcloud installation.
    # Source: https://github.com/nextcloud/all-in-one/blob/main/reverse-proxy.md#adapting-the-sample-web-server-configurations-below
    RewriteCond %{HTTP:Upgrade} websocket [NC]
    RewriteCond %{HTTP:Connection} upgrade [NC]
    RewriteCond %{THE_REQUEST} "^[a-zA-Z]+ /(.*) HTTP/\d+(\.\d+)?$"
    # Adjust to match APACHE_PORT and APACHE_IP_BINDING. See:
    RewriteRule .? "ws://${server_host}:80/%1" [P,L,UnsafeAllow3F]

    # Enable h2, h2c and http1.1 (?)
    Protocols h2 h2c http/1.1

    # This window size is said to solve slow upload speeds caused by http2:
    # (requires 'a2enmod http2; restart apache2' to load-and-enable module http2)
    # I guess it's size in bytes?
    H2WindowSize 5242880

    # "Disable HTTP TRACE method."
    # I guess this prevents site-visitors to access information inside
    # I guess this prevents site-visitors to access information inside
    # `.htaccess` files (apache config)?
    TraceEnable off
    <Files ".ht*">
        Require all denied
    </Files>

    # Support big file uploads:
    # 86400s = 24h
    LimitRequestBody 0
    Timeout 86400
    ProxyTimeout 86400

    # TLS - Transport Layer Security
    # -----------------------------------
    # The SSL-options block below was copied as-is from Nextcloud AIO
    # (All In One) docs about reverse-proxy configurations:
    # Source: https://github.com/nextcloud/all-in-one/blob/main/reverse-proxy.md#adapting-the-sample-web-server-configurations-below

    # In there you can see the default values for most of the same SSL settings:
    #Include /etc/letsencrypt/options-ssl-apache.conf

    # I believe it makes sense to declare them /after/ the include, so these
    # settings here can override the system-default?

    # -------------------------------------
    SSLEngine               on
    # Allow /only/ TLS to communicate; the normal default included SSL too.
    SSLProtocol             -all +TLSv1.2 +TLSv1.3
    # A selected subset (but almost identical to current default list) of encryption algorithms:
    SSLCipherSuite          ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:DHE-RSA-CHACHA20-POLY1305
    SSLHonorCipherOrder     off
    SSLSessionTickets       off
    # Not sure if this option is required to disable the Nextcloud warning on
    # webserver not being https behind proxy (which is true):
    SSLProxyEngine          on
    # -------------------------------------
</VirtualHost>
</IfModule>
```


# Copy of `/etc/apache2/sites-enabled/nextcloud.conf` on the local LAN webserver running Nextcloud.

```
<VirtualHost *:80>
    ServerName cloud.amp
    #DocumentRoot /home/nextcloud/nextcloud
    DocumentRoot /var/www/nextcloud

    # log files
    ErrorLog /var/log/apache2/cloud.amp-error.log
    CustomLog /var/log/apache2/cloud.amp-access.log combined

    # Note that the use of %{X-Forwarded-For}i instead of %h is not recommended.
    # Use mod_remoteip instead.
    RemoteIPHeader X-Forwarded-For
    RemoteIPInternalProxy 192.168.0.100/32
    # Is this actually used?
    RemoteIPProxiesHeader X-Forwarded-By

    # The proxy does SSL, so we're secure. Let's tell this webserver it's HTTPS
    # - even if we're HTTP between proxy and here:
    <IfModule mod_setenvif.c>
        SetEnvIf X-Forwarded-Proto "^https$" HTTPS
    </IfModule>

    LogFormat "%a %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" combined

    <Directory /var/www/nextcloud/>
        Options +FollowSymlinks
        AllowOverride All

        <IfModule mod_dav.c>
            Dav off
        </IfModule>

        <IfModule mod_headers.c>
            Header always set Strict-Transport-Security "max-age=15768000; includeSubDomains; preload"
            Header set Referrer-Policy "no-referrer"
        </IfModule> 

        SetEnv HOME /var/www/nextcloud
        SetEnv HTTP_HOME /var/www/nextcloud

        # Keeping it all /at $HOME/: (for backups ;))
        #SetEnv HOME /home/nextcloud/nextcloud
        #SetEnv HTTP_HOME /home/nextcloud/nextcloud
    </Directory>
</VirtualHost>
```
