counter=0
cap=5

until [ $counter -ge $cap ]
do
  echo $counter
  ((counter++))
done
