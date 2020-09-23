echo how many?

read max
counter=0

while [ $counter -le $max ]
do
  echo $counter
  ((counter++))
done
