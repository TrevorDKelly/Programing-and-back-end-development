============================================================================

Tools

============================================================================

nc
  Network utility
  Also is netcat on some systems
  handles http requests
  `nc -v google.com 80`
    connect to google on port 80
    once the connection is made you can make a request
      `GET /index.html HTTP/1.1`
        request the page `index.html` using HTTP version 1.1
  FLAGS
    -v => verbose mode
    -c => `enter` becomes a control flow rather than just a new line
    -l => listen mode - give it the port to listen on
            `nc -l 3456` - listening on port 3456

bash
  runs bash scripts passed to it
  `bash script_i_wrote.sh`
    runs script_i_wrote.sh file
  can make files auto run as bash
    at the top of the file
      `!#/bin/bash`
      `!#` -> shebang
      `/bin/bash` -> path to ececutable to run it with
        *zsh will not work for this
    to run
      `./script_i_wrote.sh`
        declares it as a file
      have to give permisions
        `chmod +x script_i_wrote.sh`

============================================================================

Bash Scripting

============================================================================

variables
  defining
    `name='Trevor'`
    no spaces around `=`
  referencing
    `$name`
  Incrementing
    `((variable++))`

`echo`
  output the argument passed to it
  `echo 'hello world!'`

read
  assign input to a variable
  `read name`
    takes what is enterd until `enter` is hit and saves it to `$name`
  assign multiple variables
    `read var_a var_b var_c`
    -> this is a sentence entered after
      var_a => 'this'
      var_b => 'is'
      var_c => 'a sentence entered after

Conditionals
  if statements
    ```
    if [[ condition ]]
    then
      do this
    elif [[ condition2 ]]
    then
      do other thing
    else
      do that
    fi
    ```
    multiple conditions ( AND / OR )
      ```
      if [[ condition1]] && [[ condition2 ]]
      then
        do this
      fi

      if [[ condition1 ]] || [[ condition2 ]]
      then
        do this
      fi
      ```
    if NOT (reversing boolean)
      ```
      if ! ([condition])
      then
        do this
      fi

  conditions
    STRINGS
      [[ -n str ]] -> length of string is > 0
      [[ -z str ]] -> length of string is = 0 (is an empty string)
      [[ str1 = str2 ]] -> str1 is equal to str2
      [[ str1 != str2 ]] -> str1 is NOT equal to str2

    INTEGERS
      [[ var1 -eq var2 ]] -> equal
              -ne         -> not equal
              -gt         -> greater than

              -gt         -> greater than
              -ge         -> greater than or equal
              -lt         -> less than
              -le         -> less than or equal

    FILES
      [[ -e path/to/file ]] -> `file` exists
         -f                 -> 'file` exists and is a file (not directory)
         -d                 -> `file` exists and is a directory

Loops
  ```
  while [ condition ]
  do
    thing to do
  done
  ```
  ```
  until [ condition ]
  do
    do this
  done
  ```
  ```
  for var in $collection
  do
    stuff done with $var
  done
  ```

Functions
  ```
  say_hi () {
    echo 'Hi'
  }
  ```
  arguments are numbered
    ```
    say_name () {
      echo "My name is $1"
    }

    say_name 'Trevor' #=> "My name is Trevor"
    ```

Coprocess - coproc
  allows you to run a process asyncronously
  `coproc PROCESS_NAME { do_this; } `
    names a `PROCESS_NAME` coproc
    the `do_this` function runs asyncronously when `PROCESS_NAME` is called

