TODOLIST
======

## Improvement to made

### Problems

- Seems it's possible to duplicate task, not uniq
- Find solution for crsf meta tag

### TODO

- [ ] Add watching service like Honeybadger or crow etc
- [ ] Correct depreciations warning
- [ ] Better manage errors in rails modules - Exception Buisness vs Exception technique
- [ ] Limit on length of task visual front-end
- [ ] Add an indication or flash when something went wrong
- [ ] Manage suppression
- [ ] Check about accessibility
- [ ] Presenters , Templaters why not ?
- [ ] Maybe Add javascript testing in continuous integration
- [ ] Use channels to inform
- [ ] Jsdoc - and define a js good documentation
- [ ] Add Dockerfile
- [ ] Add a Procfile
- [ ] Docker machine
- [ ] Logo to think
- [ ] Make a documentation folder
- [ ] Manage Data like records or JSON Orientation
- [ ] Search Functionnality
- [ ] Code climate
- [ ] Code documentation
- [ ] Basic concurrency
- [ ] Add tag version in versioning
- [ ] Different Branch test - development - production
- [ ] Caching
- [ ] Performance graphs
- [ ] Add some ways to evaluate
- [ ] SPA style or not
- [ ] Html or js
- [ ] Http/2
- [ ] Modularize views
- [ ] CORS to install in development or test environnement
- [ ] Honey badger or equivalent
- [ ] Split front-end and back-end
- [ ] Use of swagger to inform about API
- [ ] Flamegraph
- [ ] Chrono evolution of rendering
- [ ] Real CRUDS
- [ ] Use our own dsl
- [ ] UI Bits
- [ ] UI Css
- [ ] Constraint css
- [ ] Test css
- [ ] Test js
- [ ] Readme for each part of application
- [ ] Install for each part of application
- [ ] Licence information
- [ ] rubocop , linting
- [ ] linting  Html
- [ ] linting  js
- [ ] linting  css
- [ ] minify  css
- [ ] minify  js
- [ ] minify  Html
- [ ] Doc folder or dashboard of documentation
- [ ] HTML meta tags
- [ ] HTML meta author
- [ ] HTML meta color onglet
- [ ] favicon
- [ ] SEO
- [ ] Add a ruby-version
- [ ] Install application.js
- [ ] Add Brakeman for auditing security
- [ ] Add a editorconfig
- [ ] Add documentation notes Model
- [ ] Add a ruby-version
- [ ] Install application.js
- [ ] Add Brakeman for auditing security
- [ ] Add a editorconfig
- [ ] Add documentation notes Model
- [ ] Add validation model - a task content could not be empty
- [ ] Add NOT NULL database - a task content could not be empty
- [ ] Add a Guardfile
- [ ] Correct existing tests
- [ ] Add a travis.yml and basic continuous integration process
- [ ] Improve 404 page Remove the basic rails style
- [ ] Improve 422 page Remove the basic rails style
- [ ] Improve 500 page Remove the basic rails style
- [ ] Gemnasium
- [ ] Add seed data
- [ ] Basic Integration tests
- [ ] Install overcommit and basic configuration
- [ ] jquery or not
- [ ] underscore or not
- [ ] coffescript or not
- [ ] Better webserver (thin, puma ...)
- [ ] Basic serializer installed - Serialization to manage - Add some serializers
- [ ] Coveralls installation
- [ ] Think seeds manage with faker
- [ ] Mount application or not ?
- [ ] Install nodejs underscore
- [ ] Install nodejs jquery
- [ ] Configure gulp
- [ ] Garberish technique - basic done ; Think about some patterns to manage state
- [ ] Limit on length of task model
- [ ] State machine or not ?
- [ ] Add Brakeman for auditing security
- [ ] Rack-attack - manage ddos attack
- [ ] Add UUID - will be usable with differents sockets - No use now but later
- [ ] Front END loader ? => so yes
- [ ] UX UX UX UX UX UX UX UX UX UX UX UX UX UX UX UX UX UX
- [ ] ANIMATIONS ANIMATIONS ANIMATIONS ANIMATIONS ANIMATIONS ANIMATIONS ANIMATIONS
- [ ] Checklist for webdeveloppers [webdeveloppers simple security checklist](https://simplesecurity.sensedeep.com/web-developer-security-checklist-f2e4f43c9c56)
- [ ] API Checklist for webdeveloppers [Github clone](https://github.com/mosleymos/API-Security-Checklist)

### To think when coding

Sandi metz rules

SOLID Principle

East programming

Point free code

Code Fluent structure of a method
  check your variables
  work with your variables
  return with your result 

Conventions over configurations
 nom de variable contenant une collection => termine au pluriel
 convention descriptive => t pour tableau, h pour hash etc...


No If Only Truths

No 'if' checking in the "work with your variable" part
If est notre ennemi
If déguisé

Gérer le nil

Trop de HTML alors le décomposer 

GREEN TESTS GREEN 

Question de la responsabilite

Aller plus profond - spéléologie

Question de responsabilité ne s'applique pas seulement au classes ruby mais aussi au css, html ...

Attention déterminer une erreur d'un cas normal => est ce vraiment une erreur est une question que l'on peut se poser ?

Objet non homogènes

Abstraction et généralisation de la spécificité

2 RETURN MAX PER FUNCTION

Nom de variables, functions , class, methode est important - ne pas hésiter à renommer, un dictionnaire est utile

Choisir toujours une solution simple, si non a l'aise avec le code écrit alors le refaire - est ce que je suis bien avec mon code sérieusement ?

Pas de new dans un definition de class question de la responsablité en jeu 
Functionnal programming pour eviter les sides effects

Lecture facilite du code sans des boucles

Determiner toujours la responsabilite du code 

Determiner toujours la responsabilite du process 

step by step debugging

Gestion du nil / none ou undefined est le pire cauchemar alors faire avec

Au niveau BDD nous sommes toujours ou presque a une relation 1 a n

Documentation avec projet our en parallèle du projet tel est la question

Pour un traitement de deux objet t toujours trouver le moyen de les normaliser avant quelque traitementu

Know your tools and use it with efficiency

Avoir une normalisation du process de travail

Code works harder - First resolve then optimize

Inheritance vs Polymorphisme vs Composition to think

Clear interface  

Split code with side effect from 'pure' code

One week work

Small cf Greg Young - The art of destroying software VIMEO

Tools to make your projet change the output

Jamais de passage en production le Vendredi - Ne pas effectuer une mise en production dont on sait que l'on ne sera pas là pour gérer les problèmes - NO MEP FRIDAY

Good rules about naming

when function => begin with verb
when variable => always nouns so no verbs

From a youtube comment https://www.youtube.com/watch?v=UjhX2sVf0eg

#1: You're responsible for code quality.
#2: Use meaningful names.
#3: Write code that expresses intent.
#4: Code should speak for itself. Less comments = less maintenance.
#5: Leave the code better than you found it.
#6: Single-responsibility code.
i.e function does 1 thing well. Less arguments = better function.
classes: most methods use most of the class' properties.
#7: Tests (TDD).
#8: Work on big picture skeleton, then fill in the details later 
(interface first, implementation later).
#9: Independent components that can be used in different places.
#10: Master your craft.


Being and Doing -  From clean ruby
>These two things, the being and doing, need to come together at some point, but: why are
>we doing this?
>A common approach to refactoring complex classes is to follow this same paradigm of
>identifying related methods and breaking them out from the main class using modules.  

Split the "Being" of an object from his "Doing"

Explicit is better than implicit
>Explicit code reveals your intentions far better than implicit code 

No self if yourself -> indiquer self partout peut être ennuyant

Si une information vous prend plus d'une dizaine de minute à trouver alors votre organisation pose probleme

#### Architecture view

[Software architecture vs code ](https://www.youtube.com/watch?v=GAFZcYlO5S0)
