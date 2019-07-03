#!/bin/sh
# Usage: pandoc -f markdown -t html5 -c style.css -s --highlight-style espresso "${md}" | bash ~/scripts/rmheadbody.sh | pbcopy

# -c /Users/jyuan/apple/doc/vip/blog/scripts/pandoc_table.css
# pandoc_output=$(pandoc -f markdown -t html5 -c style.css -s --highlight-style $hs "${md}")
# IFS=
# printf '<div dir="ltr" style="text-align: left;" trbidi="on"><div style="font-size: large;">\n'

# rm <link rel="stylesheet" href="style.css" />
# -c style.css
# -H /Users/jyuan/apple/doc/vip/blog/resource/css/pandoc.css  -s
#

depth_from_md=$(grep "toc-depth:" "$md" | cut -d" " -f2)
depth=${depth_from_md:=4}

i=0
bash /Users/jyuan/jyuan-files/docs/vip/blog/resource/script/injectMarkdown.sh | pandoc -f markdown+emoji -t html5  --templat=$HOME/.pandoc/templates/default.html -M updatedDate="Updated at $(date "+%B %e, %Y")"  -s --highlight-style "${hs}"  --toc  --toc-depth=$depth | while IFS= read -r line; do
  # printf '%s\n' "$line"
  i=$((i+1))
  if  [[ "$i" -gt "7" ]] && [[ "$line" != "</head>" ]] && [[ "$line" != "<body>" ]] && [[ "$line" != "</html>" ]] && [[ "$line" != "</body>" ]] && [[ ! "$line" =~ "style.css" ]] ; then
    printf '%s\n' "$line"
  fi
done
# << "$pandoc_output"

# printf '</div></div>'