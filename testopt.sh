#!/bin/bash

rm mutex_opt
rm mutex_org

for (( i=1; i < 101; i++ ))
do
  ./parallel_mutex 5 >> mutex_opt
  ./parallel_mutex_opt 5 >> mutex_org
done

cat mutex_opt | grep Inserted | awk '{print $6}' > mutex_opt-time
cat mutex_org | grep Inserted | awk '{print $6}' > mutex_org-time

