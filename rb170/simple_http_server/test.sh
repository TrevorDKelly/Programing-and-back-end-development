function messages_received () {
  while true
  do
    an_arr=()

    read input

    an_arr+=($input)
    echo xx- $an_arr
    for i in $an_arr
    do
      echo $i
    done
  done
}

coproc SERVER { messages_received; }

nc -lv 2345 <&${SERVER[0]} >&${SERVER[1]}
