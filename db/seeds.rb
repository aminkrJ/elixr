# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


IngredientCategory.create [{description: "grain (cereal) foods", name: 'ic_1'}, {description: "lean meats and poultry", name: 'ic_2'}, {description: "dairy products", name: 'ic_3'}, {description: "vegtables and beans", name: 'ic_4'}, {description: "vegtables", name: 'ic_5'}, {description: "beans and nuts", name: 'ic_6'}, {description: "fruits", name: 'ic_7'}, {description: "super foods", name: 'ic_8'}]
