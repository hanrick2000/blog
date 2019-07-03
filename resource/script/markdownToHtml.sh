echo "handling ${md}" >>/dev/stderr
# https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
filename=$(basename -- "$md")
extension="${filename##*.}"
filename="${filename%.*}"
echo $filename >>/dev/stderr

bash /Users/jyuan/jyuan-files/docs/vip/blog/resource/script/rmheadbody.sh | minify --type=html --html-keep-conditional-comments