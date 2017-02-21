# URI Online Judge | 1005
# Average 1
# Adapted by Neilor Tonin, URI  Brazil
# Timelimit: 1
#
# Read two floating points' values of double precision A and B, corresponding to two student's grades.
# After this, calculate the student's average, considering that grade A has weight 3.5 and B has weight 7.5.
# Each grade can be from zero to ten, always with one digit after the decimal point. Don’t forget to print the
# end of line after the result, otherwise you will receive “Presentation Error”. Don’t forget the space before
# and after the equal sign.
#
# Input
#
# The input file contains 2 floating points' values with one digit after the decimal point.
#
# Output
#
# Print MEDIA(average in Portuguese) according to the following example, with 5 digits after the decimal point
# and with a blank space before and after the equal signal.
#
# Input Samples	Output Samples
# 5.0           MEDIA = 6.43182
# 7.1
#
# 0.0           MEDIA = 4.84091
# 7.1
#
# 10.0          MEDIA = 10.00000
# 10.0
require_relative "../spec_helper"
require_relative "uri_gets_counter_helper"

def solution
  a = gets.to_f
  b = gets.to_f

  weight_a = 3.5
  weight_b = 7.5

  average = ((a * weight_a) + (b * weight_b)) / (weight_a + weight_b)

  puts "MEDIA = #{format("%.5f", average)}\n"
end

RSpec.describe "1005" do
  let(:input_sample) { ["5.0", "7.1"] }
  let(:output_sample) { "MEDIA = 6.43182\n" }

  it { expect { solution }.to output(output_sample).to_stdout }
end
