# Automated updates

  * Security patches: yay! 🤓️
  * Feature changes: nay! 😭️

Do you have the choice to install/configure them separately?


# GNU/Linux works. Why?

See [Debian FAQs: "Q: Why are you fiddling with an old version of that package?"](https://www.debian.org/security/faq#oldversion):

> "The most important guideline when making a new package that fixes a security
> problem is to make as few changes as possible."

Followed by:

> "Our users and developers are relying on the exact behaviour of a release
> once it is made, so any change we make can possibly break someone's system."

That is how you plan proper updates and fixes.


<aside class="notes">
Here's the full text from the FAQ page:

> **Q: Why are you fiddling with an old version of that package?**
> 
> The most important guideline when making a new package that fixes a security problem is to make as few changes as possible. Our users and developers are relying on the exact behaviour of a release once it is made, so any change we make can possibly break someone's system. This is especially true in case of libraries: make sure you never change the Application Program Interface (API) or Application Binary Interface (ABI), no matter how small the change is.
> 
> This means that moving to a new upstream version is not a good solution, instead the relevant changes should be backported. Generally upstream maintainers are willing to help if needed, if not the Debian security team might be able to help.
> 
> In some cases it is not possible to backport a security fix, for example when large amounts of source code need to be modified or rewritten. If that happens it might be necessary to move to a new upstream version, but this has to be coordinated with the security team beforehand.
</aside>



# Some questions:

  * How well do you know or trust the "sources" of these updates?
  * Do the makers of your hardware know your system better than you do?
  * Do you trust your global player enterprises to decide in your best interests?
  * Do you want changes (which you notice!) happening automatically, whenever?
  * Can you trust your devices if they are set to auto-updates?

