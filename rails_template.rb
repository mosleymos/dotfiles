#/usr/bin/ruby

#AUTHOR:Mori Keita
#DESCRIPTION:
# Fichier pour la génération d'une application
# ruby on rails
#
#LICENCE

generate(:controller,"Static home contact about")
route "root 'static#home'"
run "rm -rf README.rdoc"
run "touch README.md"

git :init
git add:"."
git commit: %Q(-m 'Initial commit')

# Gem pour notre application rails
gem_group :development, :test do 
 gem 'pry'
 gem 'pry-rails'
 gem 'pry-stack'
end

rake("db:migrate")
run "rm -rf test/"
run "rails generate rspec:install"
git add:"."
git commit: %Q(-m 'Installation de rspec pour les test')

