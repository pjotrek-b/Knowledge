# Matrix Synapse issues with email/SMTP

Operating system: **Debian12 Bookworm**

Here are some error messages coming from our local Matrix Synapse setup, which
hopefully may save you a lot of time and trouble and nerves - because they're
easy to fix! :D


[Official documentation for /all/ matrix config options](https://github.com/matrix-org/synapse/blob/develop/docs/usage/configuration/config_documentation.md)

A short note about our email-notification server setup:

  * a slim, dedicated SMTP-forwarding relay mailserver running exim4 on Debian12.
  * "good-old", original port 25 (=plain text SMTP)
  * **no encryption** (= NO TLS, SSL, etc)
  * **no authentication**
    (this is important to know: This is /not/ an empty username/password - it's
    really /NO AUTH/ to work).
  * running as LXC container on PVE (Proxmox Virtual Environment)

Why?

> **to handle any and all notifications from all other
> containers/hosts/services in our virtual server environment as easily and
> conveniently as possible.**

So real SMTP-login/credentials only need to be configured and stored /once/ - and all other email notifications can then /hooray!/ be easily configured to use /that host/. A bit like a LAN-sendmail.

We shall call that host `postman.lan`.


## Cannot send emails over local exim4 SMTP (LAN)

Error message in Matrix logs:

```
twisted.mail._except.AUTHRequiredError: 502 Server does not support Client Authentication schemes [CRAM-MD5, LOGIN, PLAIN] 
```

Error message in Element.io client:

```
MatrixError: [500] An error was encountered when sending the email (
https://matrix.example.com/_matrix/client/v3/account/3pid/email/requestToken
) 
```


## Key takeaways:

> **Remove the `smtp_user` and `smtp_pass` config options in `/etc/matrix-synapse/conf.d/email.yaml`.

  * Empty string ("") != undefined in Synapse YAML.
  * Empty string = "attempt authentication with blank username"
  * Undefined = "do not authenticate at all" -> required for SMTP servers that allow unauthenticated relaying. 



## TLS error: "Decryption has failed."

```
TLS error on connection from (matrix.lan) [192.168.x.x] (gnutls_handshake): Decryption has failed.
```

This happens, if you have "transfer layer security" (TLS = encryption enabled),
but are talking to a plaintext (good-old port 25). Remember? ;)

Set the following options to `false`:

  * enable_tls: false
  * require_transport_security: false

Restart matrix service.
Try again.



## Working `email.yaml` config

Here's a copy of our working-tested-and-functional config file `/etc/matrix-synapse/conf.d/email.yaml`:

```
# Email Configuration
email:
  enable_notifs: true           # Whether to enable email notifications
  smtp_host: "postman.lan"      # Hostname of the SMTP server
  smtp_port: 25                 # TCP port to connect to SMTP server
    #smtp_user: ""              # Username to connect to SMTP server
    #smtp_pass: ""              # Password to connect to SMTP server
  enable_3pid_changes: true     # Users can change the third-party IDs associated with their accounts
  enable_tls: false
  require_transport_security: false # Require transport security (TLS) for SMTP
    #enable_tls: false
    #force_tls: false
    #require_transport_security: false  # Require transport security (TLS) for SMTP
  notif_for_new_users: true             # Enable notifications for new users
  app_name: 'Our Matrix Server'         # defines value for %(app)s in notif_from and email subject
  notif_from: "%(app)s <noreply@matrix.example.com>"
```


Good luck!
It'll work.
