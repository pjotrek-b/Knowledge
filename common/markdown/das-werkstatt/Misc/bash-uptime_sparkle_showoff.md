# Fun shell/bash hack to show-off uptime

```
alias sparkle="seq -s✨ 40|tr -d '[:digit:]'"; \
clear; sparkle; \
printf "\n\nThis webserver has an UPTIME (=no reboot) of more than \
3000 days:\n\n%s\n\n \
Operating System: %s --- Current date: %s\n\n" \
"$(uptime)" \
"$(cat -s /etc/issue)" \
"$(date --iso-8601)"; \
sparkle; printf "\n\n"
```

The "3000 days" part is still hardcoded though.
Adjust to your uptime accordingly, or add another one-liner parsing for it :wink: