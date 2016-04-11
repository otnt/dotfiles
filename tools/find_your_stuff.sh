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
