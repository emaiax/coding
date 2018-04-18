# URI Online Judge | 1161
# Factorial Sum
# Adapted by Neilor Tonin, URI  Brazil
# Timelimit: 1
#
# Read two numbers M and N indefinitely. Calculate and write the sum of their factorial. Be carefull, because the result can have more than 15 digits.
#
# Input
#
# The input file contains many test cases. Each test case contains two integer numbers M (0 ≤ M ≤ 20) and N (0 ≤ N ≤ 20). The end of file is determined by eof.
#
# Output
#
# For each test case in the input your program must print a single line, containing a number that is the sum of the both factorial (M and N).
#
# Input Sample	Output Sample
# 4 4           48
# 0 0           2
# 0 2           3

require_relative "../spec_helper.rb"
require_relative "uri_gets_counter_helper"

def factorial(n)
  return 1 if n <= 1
  return n * factorial(n - 1)
end

def solution
  while (n = gets) != "\n"
    puts "#{factorial(n.to_i) + factorial(gets.to_i)}\n"
  end
end

RSpec.describe "1161" do
  let(:input_sample) { ["4", "4"] }
  let(:output_sample) { "48\n" }

  it { expect(factorial(4)).to eql(24) }

  it { expect { solution }.to output(output_sample).to_stdout }
end
