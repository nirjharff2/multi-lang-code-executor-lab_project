filename="$1"
extension="${filename##*.}"
basename="${filename%.*}"
output_dir="build"

mkdir -p "$output_dir"
output="$output_dir/$basename.out"
py_output="$output_dir/$basename.pyc"

case "$extension" in
  c) gcc "$filename" -o "$output" 2> "$output_dir/compile_error.log"
     if [ $? -eq 0 ];
     then
       echo "Success: $output"
     else
       echo "Compilation failed"
       exit 1
     fi
     ;;
  cpp) g++ "$filename" -o "$output" 2> "$output_dir/compile_error.log"
       if [ $? -eq 0 ];
       then
         echo "Success: $output"
       else
         echo "Compilation failed"
         exit 1
       fi
       ;;
  py) python3 -m py_compile "$filename" 2> "$output_dir/compile_error.log"
     if [ $? -eq 0 ];
     then
       echo "Success: $py_output"
     else
       echo "Compilation failed"
       exit 1
     fi
     ;;
esac

echo ""
echo "#go to proposal pdf..."
