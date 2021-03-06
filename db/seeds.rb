require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
read_ingredients = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients = JSON.parse(read_ingredients)
ingredients_array = ingredients['drinks']

puts 'Creating ingredients...'

ingredients_array.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

puts "Done! You have #{Ingredient.count} ingredients"
