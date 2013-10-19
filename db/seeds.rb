# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.find_or_create_by_name("Movies")
Category.find_or_create_by_name("Television")
Category.find_or_create_by_name("Sports")
Category.find_or_create_by_name("Fashion")
Category.find_or_create_by_name("Food")
