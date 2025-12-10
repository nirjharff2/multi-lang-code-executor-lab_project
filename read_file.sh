filename="$1"
extension="${filename##*.}"
allowed_ext=("c" "cpp" "py")
valid=false

for ext in "${allowed_ext[@]}";
do
  if [[ "$extension" == "$ext" ]];
  then
    valid=true
    break
  fi
done

if [ "$valid" = false ];
then
  echo "**This language is yet to be added to our feature-list.**"
  echo "Allowed extensions: [${allowed_ext[*]}]"
  exit 1
else
  echo "#(.$extension) file detected... "
  bash check_dependency.sh "$extension"
  if [ $? -eq 0 ]
  then
    exit 0
  else
    exit 1
  fi
fi
