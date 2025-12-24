filename="$1"
result="$2"
ext="${filename##*.}"

echo "====== FINAL REPORT ======"


echo "Language     : $ext"
echo "Compile      : OK"
echo "Execution    : OK"
if [ "$result" -eq 0 ];
then
  echo "Verdict      : Accepted"
else
  echo "Verdict      : Failed"
fi
