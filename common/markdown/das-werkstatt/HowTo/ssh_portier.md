# HowTo have a remote-tunnel "Portier" SSH setup

These instructions are to setup an SSH setup, that allows multiple remote clients to connect to a common SSH server to allow reverse remote access through that SSH port-forwarding. This allows remote access to the *client's* network, without a permanently-open hole in a firewall.

The setup is like this:

  * A single system-user, just used for remote port forwarding:  
    A "portier".
  * The portier user has no priviledges (not even a shell), other than `permit-open` to a fixed/limited range of ports/IPs.
  * The portier has multiple `authorized_keys` set:
    Each for a different client.
  * Each ssh-key has a fixed `permit-open` rule set, so a client cannot map more than their allowed remote ports.
  * Once a client connects with their key, they get greeted by a message.
    As long as their SSH connection stays open, the remote tunnels can be used.
    Once the SSH connection is closed, all tunnels are closed too.
