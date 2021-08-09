#!/bin/bash
nthProcess=3

top -n 1 | sed '1,7d' | awk '{print $2,$13,$10,$11}' > top_out.txt


echo "PID COMMAND %CPU %MEM" > output.txt
sed -n "${nthProcess}p" top_out.txt >> output.txt

sort -k 4r top_out.txt |sed -n "${nthProcess}p"  >> output.txt

awk '{printf "%-20s|%-20s|%-20s|%-20s\n",$1,$2,$3,$4}' output.txt
echo ""
echo ""
echo ""