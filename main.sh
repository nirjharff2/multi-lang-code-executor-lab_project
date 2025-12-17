if [ $# -eq 0 ];
then
  echo "Usage: ./main.sh <source_file>"
  exit 1
fi

filename="$1"

if [ ! -f "$filename" ];
then
  echo "Error: $filename not found!"
  exit 1
fi



bash readfile.sh "$filename"
if [ $? -ne 0 ];
then
  echo "Failed at language detection / dependency check"
  exit 1
fi

echo "Dependency check passed"
echo ""

bash compile_code.sh "$filename"
if [ $? -ne 0 ];
then
  echo "Compilation failed"
  echo "Check build/compile_error.log"
  exit 1
fi

echo "Compilation successful"
echo ""

bash execute_code.sh "$filename"
if [ $? -ne 0 ];
then
  echo "Runtime error during execution"
  exit 1
fi

echo "Execution completed"
echo ""

bash compare_output.sh
result=$?

echo ""

bash report.sh "$filename" "$result"

echo ""
