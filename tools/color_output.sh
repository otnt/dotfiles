# This file is used to set output color in bash terminal
# The value is got from here:
# https://en.wikipedia.org/wiki/ANSI_escape_code

black='033[0;30m'
red='033[0;31m'
green='033[0;32m'
orange='033[0;33m'
blue='033[0;34m'
purple='033[0;35m'
cyan='033[0;36m'
nc='\033[0m' # No Color]]]'

echo_red() {
    echo "${red}${1}${nc}"
}
