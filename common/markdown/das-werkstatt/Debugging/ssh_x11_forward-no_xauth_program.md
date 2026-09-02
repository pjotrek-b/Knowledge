# Error during SSH forwarding X11: "No xauth program"

Running `ssh -X hostname` gives the following error (with verbose on):

> "Remote: No xauth program; cannot forward X11"

Do the following: `apt install xauth`
