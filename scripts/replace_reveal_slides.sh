# export md=""
# export template_file=""

# https://github.com/plainas/tq
reveal_slides=$(pandoc --highlight-style espresso -f markdown+link_attributes -t revealjs -s "${smd}" -V revealjs-url=https://revealjs.com | tq .reveal)

# template_text=$(<${template})
IFS=
template_text="$(cat ${template_file})"
# echo template_text $template_text
result=${template_text/__reveal_slides__/$reveal_slides}

# https://github.com/tdewolff/minify/tree/master/cmd/minify
echo ${result} | minify --type=html >${dest_file}
