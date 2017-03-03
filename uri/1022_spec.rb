# URI Online Judge | 1022
# TDA Rational
# By Neilor Tonin, URI  Brazil
# Timelimit: 1
#
# You were invited to do a little job for your Mathematic teacher. The job is to read a Mathematic expression
# in format of two rational numbers (numerator / denominator) and present the result of the operation. Each
# operand or operator is separated by a blank space. The input sequence (each line) must respect the following
# format: number, (‘/’ char), number, operation char (‘/’, ‘*’, ‘+’, ‘-‘), number, (‘/’ char), number. The
# answer must be presented followed by ‘=’ operator and the simplified answer. If the answer can’t be simplified,
# it must be repeated after a ‘=’ operator.
#
# Considering N1 and D1 as numerator and denominator of the first fraction, follow the orientation about how
# to do each one of these 4 operations:
#
# Sum: (N1*D2 + N2*D1) / (D1*D2)
# Subtraction: (N1*D2 - N2*D1) / (D1*D2)
# Multiplication: (N1*N2) / (D1*D2)
# Division: (N1/D1) / (N2/D2), that means (N1*D2)/(N2*D1)
#
# Input
#
# The input contains several cases of test. The first value is an integer N (1 ≤ N ≤ 1*104), indicating the
# amount of cases of test that must be read. Each case of test contains a rational value X (1 ≤ X ≤ 1000),
# an operation (-, +, * or /) and another rational value Y (1 ≤ Y ≤ 1000).
# Output
#
# The output must be a rational number, followed by a “=“ sign and another rational number, that is the
# simplification of the first value. In case of the first value can’t be simplified, the same value must be
# repeated after the ‘=’ sign.
#
# Input Sample	  Output Sample
# 4
# 1 / 2 + 3 / 4   10/8 = 5/4
# 1 / 2 - 3 / 4   -2/8 = -1/4
# 2 / 3 * 6 / 6   12/18 = 2/3
# 1 / 2 / 3 / 4   4/6 = 2/3

require_relative "../spec_helper.rb"
require_relative "uri_gets_counter_helper"

def gcd(a, b)
  r = a % b

  while r != 0
    a = b
    b = r
    r = a % b
  end 

  return b
end

def simplifier(text)
  splitted = text.split(/\s/)
  n1        = splitted[0].to_i
  d1        = splitted[2].to_i
  operation = splitted[3]
  n2        = splitted[4].to_i
  d2        = splitted[6].to_i

  numerator, denominator = case operation
                           when "+" then [(n1 * d2) + (n2 * d1), d1 * d2]
                           when "-" then [(n1 * d2) - (n2 * d1), d1 * d2]
                           when "*" then [n1 * n2, d1 * d2]
                           when "/" then [n1 * d2, n2 * d1]
                           end

  divisor = gcd(numerator, denominator)

  "#{numerator}/#{denominator} = #{numerator / divisor}/#{denominator / divisor}"
end

def solution
  gets.to_i.times do
    puts simplifier(gets.chomp)
  end
end

RSpec.describe "1122" do
  let(:input_sample) { ["4", "1 / 2 + 3 / 4", "1 / 2 - 3 / 4", "2 / 3 * 6 / 6", "1 / 2 / 3 / 4"] }
  let(:output_sample) { "10/8 = 5/4\n-2/8 = -1/4\n12/18 = 2/3\n4/6 = 2/3\n" }

  it { expect(simplifier("1 / 2 + 3 / 4")).to eql("10/8 = 5/4") }
  it { expect(simplifier("1 / 2 - 3 / 4")).to eql("-2/8 = -1/4") }
  it { expect(simplifier("2 / 3 * 6 / 6")).to eql("12/18 = 2/3") }
  it { expect(simplifier("1 / 2 / 3 / 4")).to eql("4/6 = 2/3") }

  it { expect { solution }.to output(output_sample).to_stdout }
end
