
injectAtH4=3

h4Count=0

while IFS= read -r line || [ -n "$line" ] ; do
  # printf '%s\n' "$line"
  if  [[ "$line" == $'#### '* ]] ; then
    h4Count=$((h4Count+1))
    if [[ $h4Count == 3 ]] ; then
      printf '%s\n' "<script>inlineAds=true</script><script src='//ap.lijit.com/www/delivery/fpi.js?z=332935&width=728&height=90'></script><p>"
    fi
  fi
  printf '%s\n' "$line"
done < "$md"