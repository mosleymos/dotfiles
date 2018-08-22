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


# mysql expression read from database 

mysql -h "some_host" -u "some_user" -p "some_password"  "some_database" < some_fichier_avec_requetes_sql.sql | while read line; do echo $line >> some_file_text.txt ; done


```
