require_relative '../setup'
require_relative './exercise_1'

puts "Exercise 2"
puts "----------"

# Your code goes here ...
# Load the first store
@store1 = Store.find(1)

# Load the second store
@store2 = Store.find(2)

# Update the first store
@store1.update(name: "Updated Burnaby")

# Alternatively, you could do it in two steps:
# @store1.name = "Updated Burnaby"
# @store1.save