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

```ruby

<%= link_to(fa_icon('trash').html_safe,
                        {:remote => true,
                         :ps_fiches_technique_id => @ps_fiches_technique.id,
                         :ps_fiches_techniques_regime_id => ps_fiches_techniques_regime.id,
                         :ad_regime_id => ps_fiches_techniques_regime.ad_regime.id,
                         :controller => :ps_fiches_techniques,
                         :method => :delete,
                         :onclick => 'delete_regime()',
                         :action => 'delete_regime'},
                        {:title => 'Permet l effacement de cette ligne de régime',
                         :confirm => 'êtes vous sur de vouloir détruire ce régime ? ',
                         :id => id_condi}) %>



  def save_presentation_planning_reception
    _enregistrement_presentation_planning_reception(params)
    render :json => {:message => 'information transmise'}, :status => :ok
  end

def essai
  lambda do 
    puts 1
  end
end

def essai2
  lambda do 
    puts 2
  end
end

[essai, essai2].each do |e|
   e.call
end


```

```ruby

  def _tableau_klasses_restor_ayant_codes_metiers
    klasses_names = []
    Dir.foreach("#{Rails.root.to_s}/app/models") do |model_path|
      klasses_names << model_path[0..-4] if _fichier_modele_inclus_application_restor?(model_path)
    end
    klasses_names.map{|model| model.capitalize.singularize.camelize.constantize}
  end

  def _selectionner_les_modeles_comportant_les_methodes_metier(list_klasses)
    list_klasses.select do |klass| 
      (klass.ancestors.include?(ActiveRecord::Base) && _objet_comporant_methode_metier?(klass)) 
      # (klass.ancestors.include?(ActiveRecord::Base) && _klass_comporant_methode_metier?(klass))
    end
  end

  def _objet_comporant_methode_metier?(klass)
    klass.new.attributes.key?("code") &&  klass.new.public_methods(false).reject{|meth| meth.to_s =~ /before_|_one|after_|callback|autosave|validate/ }.any?{|meth| meth.to_s.end_with?('?') }
  end

  def _klass_comporant_methode_metier?(klass)
    regexp_trouver_occurence_symbole_code = /(:code +(\s*))|(code:+(\s*))|(:code=>)|code==/i
    (klass.methods - ActiveRecord::Base.methods).map{|methode_klass| klass.method(methode_klass).source }
                                                .any?{|code_source| code_source =~ regexp_trouver_occurence_symbole_code}
  end
  def _fichier_modele_inclus_application_restor?(fichier_modele)
    fichier_modele.start_with?('ad_','bj_','ef_','fi_','ge_','lo_','pr_', 'ps_', 'sa_', 'se_', 'st_')
  end

  def _methodes_metiers_implementes?(klass)
      raise NotImplementedError.new("Absence de methode initialisation des valeurs metier #{klass.name}") if !klass.respond_to?(:initialisation_des_valeurs_metier)
      raise NotImplementedError.new("Absence de liste code protégés des valeurs metier #{klass.name}") if !klass.respond_to?(:liste_codes_proteges)
  end

```

Recherche de méthodes sur methodes avec interrogation

```ruby

  def _selectionner_les_modeles_comportant_les_methodes_metier(list_klasses)
    list_klasses.select do |klass| 
      not_start_with_lide_or_traca   = !(klass.to_s.underscore.start_with?('lide_', 'tr_'))
      is_it_have_a_code_attribute    = klass.new.attributes.key?("code")

      (not_start_with_lide_or_traca && is_it_have_a_code_attribute && _objet_comportant_methode_metier?(klass))
    end
  end

  def _objet_comportant_methode_metier?(klass)
    begin
      obj_methods = klass.new.public_methods(false)
      inclus_method_terminant_par_point_dinterrogation = obj_methods.any?{|meth| meth.to_s.end_with?('?')}
      source_methodes_inclus_dans_code_source_code     = obj_methods.any?{|meth| klass.new.method(meth).source.include?('code')}
      inclus_method_terminant_par_point_dinterrogation && source_methodes_inclus_dans_code_source_code
    rescue => e
      puts e 
    end
  end

```

Websocket approach

```javascript
// JS

var success = function(response) {
  console.log("Wow it worked: "+response.message);
}

var failure = function(response) {
  console.log("That just totally failed: "+response.message);
}

var task = {
  name: 'Start taking advantage of WebSockets',
  completed: false
}

var dispatcher = new WebSocketRails('localhost:3000/websocket');


function addCommentToDom(comment) {
  console.log('just received new comment: ', comment.name);
}

dispatcher.bind('comments.new', addCommentToDom);


// dispatcher.trigger('task.create', task, success, failure);

 dispatcher.trigger('task', task, success, failure);

 ```


 ```ruby
// BACKEND
// Controller

# Essai de quelques essais avec des websockets
# voir la documentation officielle
# https://github.com/websocket-rails/websocket-rails/wiki
class TaskController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def create
    # The `message` method contains the data received
    WebsocketRails[:hello].trigger(:event_name, {:hello => 'websocket'})

    logger.info '*' * 500
    logger.info message
    logger.info '*' * 500

    task = {
      :name => 'hello',
      :completed => true
    }
		#send_message :create_success, task, :namespace => :task
    #trigger_success({ :message => 'awesome level is sufficient'})
    new_message = {:message => 'this is a message'}
    send_message :event_name, new_message
  end
end

```

Applicabilité - concept à creuser - From object on Rails

```ruby
# Forme de decorateur
class ImageAffichage < Decorateur
  def render_body
    @context.render(:partial =>"/element/sous_partiel", :locals =>{ :post => self })
  end
end

#Usage de classe 
class Link < Decorateur
  def self.applicable_to? object
    object.is_a? (SomeKlass)
  end
end
```
