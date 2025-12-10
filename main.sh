if [ $# -eq 0 ];
then
  echo "cmnd: ./main.sh file_name"
  exit 1
fi

filename="$1"

if [ ! -f "$filename" ];
then
  echo "Error: $filename not found!!"
  exit 1
fi


bash read_file.sh "$filename"

if [ $? -eq 0 ]
then
  bash compile_code.sh "$filename"
fi

echo "We are almost done!!"
