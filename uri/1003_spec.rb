# URI Online Judge | 1003
# Simple Sum
# Adapted by Neilor Tonin, URI  Brazil
# Timelimit: 1
# Read two integer values, in this case, the variables A and B. After this, calculate the sum between them and assign it to the variable SOMA.
# Write the value of this variable.
#
# Input
#
# The input file contains 2 integer numbers.
#
# Output
#
# Print the variable SOMA with all the capital letters, with a blank space before and after the equal signal followed by the corresponding
# value to the sum of A and B. Like all the problems, don't forget to print the end of line, otherwise you will receive "Presentation Error"
#
# Input Samples	Output Samples
# 30            SOMA = 40
# 10
#
# -30           SOMA = -20
# 10
#
# 0             SOMA = 0
# 0
require_relative "../spec_helper"
require_relative "uri_gets_counter_helper"

def solution
  puts "SOMA = #{gets.to_i + gets.to_i}\n"
end

RSpec.describe "1003" do
  let(:input_sample) { ["30", "10"] }
  let(:output_sample) { "SOMA = 40\n" }

  it { expect { solution }.to output(output_sample).to_stdout }
end
