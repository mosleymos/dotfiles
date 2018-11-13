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

Simple HTML webcomponent

cf [article](https://dev.to/jamesrweb/an-introduction-to-custom-elements-5327)

```javascript

class MyComponent extends HTMLElement {
  static get observedAttributes() {
    return [];
  }

  constructor(...args) {
    super(...args);
  }

  connectedCallback() {}

  disconnectedCallback() {}

  adoptedCallback() {}

  attributeChangedCallback(attrName, oldVal, newVal) {}
}

window.customElements.define('my-component', MyComponent);


// Possibilité usage 
var $myComponent = new MyComponent

```


Aleatoire check

```ruby

res =  SomeActiveRecordModel.all.shuffle.take(10).map do |ft_prod|
  formatte = sprintf "%#.4f", ft_prod.some_integer_method_or_attribute
  stringee = ft_prod.quantite_net.to_s
  [formatte, stringee]
end

ap res

```
