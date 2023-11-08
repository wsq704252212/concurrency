#!/bin/bash

rm original
rm mutex

for (( i=1; i < 101; i++ ))
do
  ./parallel_hashtable $i >> original
  ./parallel_mutex $i >> mutex
done

cat original | grep Inserted | awk '{print $6}' > original-time
cat mutex | grep Inserted | awk '{print $6}' > mutex-time
