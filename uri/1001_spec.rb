# URI Online Judge | 1001
# Extremely Basic
# Adapted by Neilor Tonin, URI  Brazil
# Timelimit: 1
#
# Read 2 integer values and store them in variables, named A and B and make the sum of these two variables, assigning its result to the variable X. Print X as shown below. Don't present any message beyond what is being specified and don't forget to print the end of line after the result, otherwise you will receive “Presentation Error”.
#
# Input
#
# The input file contain 2 integer values.
#
# Output
#
# Print the variable X according to the following example, with a blank space before and after the equal signal. 'X' is uppercase and you have to print a blank space before and after the '=' signal.
#
# Input Samples	| Output Samples
# 10              X = 19
# 9
#
# -10             X = -6
# 4
#
# 15              X = 8
# -7
require_relative "../spec_helper"

def solution(a, b)
  puts "X = #{a + b}\n"
end

RSpec.describe "1001" do
  it { expect { solution(10, 9) }.to output("X = 19\n").to_stdout }
  it { expect { solution(-10, 4) }.to output("X = -6\n").to_stdout }
  it { expect { solution(15, -7) }.to output("X = 8\n").to_stdout }
end
