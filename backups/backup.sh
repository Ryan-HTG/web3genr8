#!/bin/bash
array=$(docker ps --format '{{.Names}}')

for i in ${array[@]}; do
if echo "$i" | grep 'db'; then
echo $i
docker exec "$i" /usr/bin/mysqldump -uroot --password=local primary > "$i $(date '+%Y-%m-%d-%H:%M:%S').sql"
fi
done;

