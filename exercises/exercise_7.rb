require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
# Add validations to Store and Employee models

class Store < ActiveRecord::Base
  has_many :employees

  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :must_carry_mens_or_womens_apparel

  private

  def must_carry_mens_or_womens_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:base, "Stores must carry at least one of the men's or women's apparel")
    end
  end
end

class Employee < ActiveRecord::Base
  belongs_to :store

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store, presence: true
end


# Ask the user for store details
puts "Please enter the following details to add the new store:"

# Prompt for store name
print "Store name: "
store_name = gets.chomp

# Prompt for annual revenue
print "Annual revenue (must be a number): "
annual_revenue = gets.chomp.to_i  # Convert input to integer

# Prompt for mens apparel (true/false)
print "Carries men's apparel? (true/false): "
mens_apparel = gets.chomp.downcase == 'true'

# Prompt for womens apparel (true/false)
print "Carries women's apparel? (true/false): "
womens_apparel = gets.chomp.downcase == 'true'

# Attempt to create a store with the provided information
new_store = Store.new(
  name: store_name,
  annual_revenue: annual_revenue,
  mens_apparel: mens_apparel,
  womens_apparel: womens_apparel
)

# Try to save the new store and display the error messages if any
if new_store.save
  puts "Store created successfully!"
else
  puts "Error(s) creating store:"
  new_store.errors.full_messages.each do |message|
    puts message
  end
end

