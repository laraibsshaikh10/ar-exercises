require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  has_many :employees
end


class Employee < ActiveRecord::Base
  belongs_to :store
end

# Load the first store
@store1 = Store.find(1)

# Load the second store
@store2 = Store.find(2)

# Create employees for the first store
@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "Ralph", last_name: "Lauren", hourly_rate: 70)
@store1.employees.create(first_name: "Jackie", last_name: "Black", hourly_rate: 65)

# Create employees for the second store
@store2.employees.create(first_name: "Alicia", last_name: "Johnston", hourly_rate: 55)
@store2.employees.create(first_name: "Robert", last_name: "Smith", hourly_rate: 45)
@store2.employees.create(first_name: "Carl", last_name: "Davison", hourly_rate: 60)
