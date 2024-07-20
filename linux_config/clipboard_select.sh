#!/bin/bash
# Author: tarungovindk - choose x11 xclip or kitty's 'kitten clipboard' based on
# Motive: choose a working clipboard automatically instead of going through the painfull process of closing and 
# repoening the terminal

# IMPORTANT #
#  - Use the script to only copy test. Image copy is not supported

#   1. if X11 xclip is working choose x11 xclip as the clpboard
#   2. else if run from kitty term, enable kitty's kitten clipboard
#   3. The default clipboard used in the nvim and tmux will be replaced with this script
#   4. In kitty, add 'kitten +kitten ssh -o TERMINAL=kitty user@server'. This will set the terminal that's used so, the script can track the terminal

# commandline options
#   --help
#   -selection | -sel | --selection - moves the selection to the clipboard
#   -o                              - pastes from the clipboard to stdout
#   -status | --status |            - lets the user know which clipboard is being used (kitten clipboard or xclip)


exists_array=()
# Check if the binary exists
function check_programs() {
  #exists_array=()
  for program in "$@"; do
    if command -v "$program" >/dev/null 2>&1; then
      exists_array+=(1)
      echo "check1 : "$program" exists"
    else
      exists_array+=(0)
      echo "check1 : "$program" doesnot exist"
    fi
  done
  echo "${exists_array[@]}"
}

function main() {
    # check1: check if the programs exist
    arg_array=("xclip" "kitten")
    check_programs "${arg_array[@]}"
    check_ret=$exists_array
    random_string=$(head /dev/urandom | tr -dc 'a-z0-9' | head -c 10)
    if [ "${check_ret[0]}" == "1" ]; then
        # check if xclip works - uses primary clipboard (traditional mouse middle button) to not create a mess on system clipboard ;)
        echo $random_string | xclip -sel primary
        random_string_rtt=$(xclip -sel primary -o)
        if [ "$random_string" == "$random_string_rtt" ]; then
            echo "xclip works"
            return 0;
        fi
    else
        echo "xclip failed - checking kitten clipboard"
        echo "xclip expected : " $random_string " received : " $random_string_rtt;
        if [ "${check_ret[1]}" == "1" ]; then
            echo $random_string | kitten clipboard
            random_string_rtt="yada"
            random_string_rtt=$(kitten clipboard -p)
            if [ "$random_string" == "$random_string_rtt" ]; then
                echo "kitten clipboard works"
            else
                echo "both xclip and kitten clipboard failed - restart the terminal - good luck"
            fi
        else
            echo "both xclip and kitten clipboard failed - restart the terminal - good luck"
        fi
    fi
}

main
