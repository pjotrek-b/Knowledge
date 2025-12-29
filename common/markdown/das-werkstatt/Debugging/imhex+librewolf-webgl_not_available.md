# Fix - Hex Editor "ImHex" & LibreWolf: WebGL not available

When opening the [web-version of ImHex HexEditor](https://web.imhex.werwolv.net/) in [LibreWolf web-browser](https://librewolf.net/), with the default settings, I get the following error message:

> web.imhex.werwolv.net
> "**WebGL not available with stencil buffer**"

😭 🤷‍♀️ 

# Solution

The reason is, that by default LibreWolf has the option `webgl.disabled = true`. Simply set it to `false`to enable [WebGL](https://en.wikipedia.org/wiki/WebGL) 😄 

Enable WebGL, by doing this:

1. Open the page `about:config` in Librewolf
2. Search for `webgl.disabled`
3. Set it to `false`
4. Reload imhex website.

This should do the trick!

Have fun!
Happy hexing 🤓️ 💾️