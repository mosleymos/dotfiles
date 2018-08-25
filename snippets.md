Snippets
====

Extract base url

```bash
# Url
grep -Eo '(http|https)://[^/"]+' 

# Prise de l'ensemble de l'url
grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*"

# Grep plus large
grep -o "http[^ ]*"


# kill rails server when not found
kill -INT $(cat tmp/pids/server.pid)

lsof -wni tcp:3000


# mysql creation db en ligne
mysql --user=some_user --password=some_password --host=some_host --port=some_port -e "CREATE DATABASE some_database"

# mysql dump
mysqldump  --verbose -hsome_host -usome_user -psome_password --databases some_database > ~/dumps/some_dump.sql

# mysql expression read from database 

mysql -h "some_host" -u "some_user" -p "some_password"  "some_database" < some_fichier_avec_requetes_sql.sql | while read line; do echo $line >> some_file_text.txt ; done

# netcat listen port
nc -lp 3000
```
