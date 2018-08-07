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


```
