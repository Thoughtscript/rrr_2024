# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Will automatically look in app/models directory.
# require_relative '../app/models/example.rb'

puts "Seeding..."

a = Example.new(:name => "example1")
puts a.msg
puts a.name
# Constructor does not save automatically.
a.save

# Using symbol hash.
Example.create(:name => "example2")

# Using validation with !
Example.create!(name: "example3")
Example.create!(name: "example4")
Example.create!(name: "example5")

# Will fail since :random is not defined.
# Remember that basic accessors, getters, setters come out of box on Active Record models.
# Example.create(:name => "example6", :random => "test")

p Example.first

p Example.all

# Lightweight FK SubExample -> Example
# Does not enforce referential integrity - no cascade
# (Only uses belong_to / has_many)

a.sub_examples.create!(name: "subexample1", example_id: 1)
puts a.sub_examples

SubExample.create!(name: "subexample2", example_id: 2)
SubExample.create!(name: "subexample3", example_id: a.id)

puts a
p SubExample.all

puts "Seeding done."