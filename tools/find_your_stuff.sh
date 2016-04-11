apt-get update -y -qq && \
apt-get install -y -qq tree # tree could be used to visualize search result

# find files and print them
ff() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: $ ff \"*.go\""
  else
    find . -name "$1"
  fi
}

# find files and visiualize them
fft() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: $ fft \"*.go\""
  else
    tree -P "$1"
  fi
}

# find pattern string in file
fs() {
  if [ "$#" -ne 2 ]; then
    echo "Usage: $ fs \"pattern\" \"*.go\""
  else
    grep -E $1 $2
  fi
}

# find pattern string in file recursively
fsr() {
  if [ "$#" -ne 2 ]; then
    echo "Usage: $ fsr \"pattern\" \"*.go\""
  else
    ff "$2" | xargs grep --color=always -E $1
  fi
}
