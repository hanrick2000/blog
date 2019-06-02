#!/bin/sh
# Usage: pandoc -f markdown -t html5 -c style.css -s --highlight-style espresso "${md}" | bash ~/scripts/rmheadbody.sh | pbcopy
i=0
printf '<div dir="ltr" style="text-align: left;" trbidi="on"><div style="font-size: large;">\n'
while IFS= read -r line; do
  i=$((i+1))
  if [ "$i" -gt "7" ] && [ "$line" != "</head>" ] && [ "$line" != "<body>" ] && [ "$line" != "</html>" ] && [ "$line" != "</body>" ]; then
    printf '%s\n' "$line"
  fi
done

printf '</div></div>'


