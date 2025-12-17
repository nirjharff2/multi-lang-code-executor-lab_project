expected="tests/expected.txt"
actual="build/user_output.txt"

if diff -q "$expected" "$actual" >/dev/null;
then
  echo "Accepted"
  exit 0
else
  echo "Wrong answer"
  exit 1
fi
