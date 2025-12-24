filename="$1"
extension="${filename##*.}"
basename="${filename%.*}"

input_file="tests/input.txt"
output_file="build/user_output.txt"

case "$extension" in
  c|cpp)
    ./build/$basename.out < "$input_file" > "$output_file"
    ;;
  py)
    python3 "$filename" < "$input_file" > "$output_file"
    ;;
esac
