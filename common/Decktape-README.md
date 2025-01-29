# Installing Decktape to render PDFs

...and getting the right versions of NodeJS, NPM - and Puppeteer (Chrome) to play together.
On (X)ubuntu 20.04 (in 2025-01)


I still find it very confusing.
However: The Decktape installation now works, after:

  1) Updating nodejs quasi manually to v18 (18.20.6)
     curl -sL https://deb.nodesource.com/setup_18.x | sudo bash -

  2) updating npm to 8.19.4
     npm install npm@^8.0 -g

  3) installing puppeteer
     version: 24.1.1
     chrome installed (`~/.cache/puppeteer/chrome`):

        * linux-127.0.6533.119/
        * linux-132.0.6834.110/

     npm install puppeteer
     Then moving /root/.cache/puppeteer to ~/.cache/puppeteer
     
  4) npm install decktape@^3.0
     Working version: v3.14.0 
