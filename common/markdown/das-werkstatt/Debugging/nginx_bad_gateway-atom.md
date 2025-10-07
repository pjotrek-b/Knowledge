Posted online already upstream: https://github.com/artefactual/atom/issues/2165

# Here's a copy:

I'm posting this issue + solution in case someone runs into the same thing:

I've setup nginx according to [atom install docs v2.9 / ubuntu 24.04](https://www.accesstomemory.org/en/docs/2.9/admin-manual/installation/ubuntu/#installation-ubuntu)

When opening my Atom website in a browser, I get:

> 502 Bad Gateway
> nginx/1.24.0 (Ubuntu)

**[SOLUTION]**
php-fpm isn't running.
Make sure you've followed and ran the commands in the above install-howto:
```
sudo systemctl enable php8.3-fpm
sudo systemctl start php8.3-fpm
```

Refresh the website: and you'll get a friendly AtoM "hello".

🌻 🌻 🌈 🌻 
