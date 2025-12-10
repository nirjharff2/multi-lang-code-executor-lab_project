echo "Executing dependency checking..."
echo ""

ext=$1
echo "#checking dependencies for .$ext files..."

install_needed=false

case "$ext" in
  c)
    if command -v gcc >/dev/null 2>&1;
    then
      echo "#GCC compiler found!"
      exit 0
    else
      echo "#GCC compiler not found!"
      install_needed=true
    fi;;
  cpp)
      if command -v g++ >/dev/null 2>&1;
      then
        echo "#G++ compiler found!"
        exit 0
      else
        echo "#G++ compiler not found!"
        install_needed=true
      fi;;
  py)
      if command -v python3 >/dev/null 2>&1;
      then
        echo "Python3 interpreter found!"
        exit 0
      else
        echo "Python3 interpreter not found!"
        install_needed=true
      fi;;
esac

if [ "$install_needed" = true ];
then
  bash install_dependency.sh "$ext"
  if [ $? -eq 0 ];
  then
    exit 0
  else
    exit 1
  fi
fi
