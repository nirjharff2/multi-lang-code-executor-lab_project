lang="$1"
echo "#installing $lang ..."

case "$lang" in
  c|cpp) sudo apt-get update -y
     sudo apt-get install -y build-essential
     ;;
 py) sudo apt-get update -y
     sudo apt-get install -y python3
     ;;
esac

hash -r

case "$lang" in
  c) cmd="gcc";;
cpp) cmd="g++";;
 py) cmd="python3";;
esac


if command -v "$cmd" >/dev/null 2>&1;
then
  echo "#installed succesfully.."
  exit 0
else
  echo "#Error installing...quiting.."
  exit 1
fi
