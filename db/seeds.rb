# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

QUOTES = [
  "Don't stop when you are tired.  STOP when you are done!",
  "The best way to predict the future is to create it.",
  "You don't have to be great to start, but you have to start to be great."
]

QUOTES.each do |quote|
  Quote.create(text: quote, author: "Some dude")
end
