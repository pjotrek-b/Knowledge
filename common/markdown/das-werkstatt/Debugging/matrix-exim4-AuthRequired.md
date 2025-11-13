# Matrix Synapse issues with email/smtp

## Cannot send emails over local exim4 SMTP (LAN)

Error message in Matrix logs:

```
twisted.mail._except.AUTHRequiredError: 502 Server does not support Client Authentication schemes [CRAM-MD5, LOGIN, PLAIN] 
```

Error message in Element.io client:

```
MatrixError: [500] An error was encountered when sending the email (
https://matrix.arkthis.com/_matrix/client/v3/account/3pid/email/requestToken
) 
```


## Key takeaways:

> **Remove the `smtp_user` and `smtp_pass` config options in `/etc/matrix-synapse/conf.d/email.yaml`.

  * Empty string ("") != undefined in Synapse YAML.
  * Empty string = "attempt authentication with blank username"
  * Undefined = "do not authenticate at all" -> required for SMTP servers that allow unauthenticated relaying. 



## TLS error: Decryption failed.

```
TLS error on connection from (matrix.volt) [192.168.0.xxx] (gnutls_handshake): Decryption has failed.
```

This happens, if you have "transfer layer security" (TLS = encryption enabled), but are talking to a plaintext (good-old port 25).


Set the following options to `false`:

  * enable_tls: false
  * require_transport_security: false

Restart matrix service.
Try again.



## Working `email.yaml` config

```
# Email Configuration
email:
  enable_notifs: true           # Whether to enable email notifications
  smtp_host: "postmann.amp"     # Hostname of the SMTP server
  smtp_port: 25                 # TCP port to connect to SMTP server
    #smtp_user: ""              # Username to connect to SMTP server
    #smtp_pass: ""              # Password to connect to SMTP server
  enable_3pid_changes: true     # Users can change the third-party IDs associated with their accounts
  enable_tls: false
  require_transport_security: false # Require transport security (TLS) for SMTP
    #enable_tls: false
    #force_tls: false
    #require_transport_security: false   # Require transport security (TLS) for SMTP
  notif_for_new_users: true           # Enable notifications for new users
  app_name: 'ArkThis Matrix Server'   # defines value for %(app)s in notif_from and email subject
  notif_from: "%(app)s <noreply@matrix.arkthis.com>"
```
