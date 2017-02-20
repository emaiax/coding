# URI Online Judge | 1170
# Blobs
# Adapted by Neilor Tonin, URI  Brazil
# Timelimit: 1
#
# On the planet Alpha lives the creature Blobs, that eats just half of its supply of food available all day.
# Write an algorithm that reads the initial capacity of the food supply (in Kg), and calculate how many days
# will pass before Blobs eat all this supply until left a kg or less.
#
# Input
#
# The first line of the input contains a single integer N (1 ≤ N ≤ 1000), indicating the number of test cases.
# Each test case contains a single floating-point number X (1 ≤ X ≤ 1000), indicating the amount of food available for Blobs.
#
# Output
#
# For each test case, print one line containing the number of days that blobs will take to eat all their food supply,
# followed by the word "dias" that means days in portuguese.
#
# Input Sample	Output Sample
# 3
# 40.0          6 dias
# 200.0         8 dias
# 300.0         9 dias
#
require_relative "../spec_helper"
require_relative "uri_gets_counter_helper"

def solution
  gets.to_i.times do
    food_weight = gets.to_i
    days_passed = 0

    while food_weight > 1.0
      days_passed += 1
      food_weight /= 2.0
    end

    puts "#{days_passed} dias"
  end
end

RSpec.describe "1170" do
  let(:input_sample) { ["3", "40.0", "200.0", "300.0"] }
  let(:output_sample) { "6 dias\n8 dias\n9 dias\n" }

  it { expect { solution }.to output(output_sample).to_stdout }
end
