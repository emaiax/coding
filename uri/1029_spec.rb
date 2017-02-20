# URI Online Judge | 1029
# Fibonacci, How Many Calls?
# By Neilor Tonin, URI  Brazil
# Timelimit: 1
#
# Sometimes when you are a Computer Science student, you’ll see an exercise or a problem involving the Fibonacci sequence.
# This sequence has the first two values 0 (zero) and 1 (one) and each next value will always be the sum of the two preceding numbers.
# By definition, the formula to find any Fibonacci number is:
#
# fib(0) = 0
# fib(1) = 1
# fib(n) = fib(n-1) + fib(n-2);
#
# One way of finding Fibonacci numbers is by recursive calls. This is illustrated below, presenting the tree of derivation
# when we calculate fib(4), i.e. the fifth value of this sequence:
#
# In this way,
# fib(4) = 1+0+1+1+0 = 3
# 8 recursive calls were done.
#
# Input
#
# The first input line contains a single integer N, indicating the number of test cases. Each test case contains an integer number X (1 ≤ X ≤ 39) .
#
# Output
#
# For each test case we will have an output line, in the following format: fib(n) = num_calls calls = result, where num_calls is the number of recursive calls, always with a space before and after the equal sign, as shown below.
#
# Input Sample	Output Sample
# 2
# 5              fib(5) = 14 calls = 5
# 4              fib(4) = 8 calls = 3
require_relative "../spec_helper"
require_relative "uri_gets_counter_helper"

def fib(n)
  return 0 if n == 0
  return 1 if n == 1

  @cycles += 2

  return fib(n - 2) + fib(n - 1)
end

def solution
  gets.to_i.times do
    @cycles = 0
    n = gets.to_i
    fibonacci = fib(n)

    puts "fib(#{n}) = #{@cycles} calls = #{fibonacci}"
  end
end

RSpec.describe "1029" do
  let(:input_sample) { ["2", "5", "4"] }
  let(:output_sample) { "fib(5) = 14 calls = 5\nfib(4) = 8 calls = 3\n" }

  before { @cycles ||= 0 }

  it { expect(fib(0)).to eql(0) }
  it { expect(fib(1)).to eql(1) }
  it { expect(fib(2)).to eql(1) }
  it { expect(fib(3)).to eql(2) }
  it { expect(fib(4)).to eql(3) }
  it { expect(fib(5)).to eql(5) }

  it { expect { fib(0) }.to_not change { @cycles } }
  it { expect { fib(1) }.to_not change { @cycles } }

  it { expect { fib(2) }.to change { @cycles }.from(0).to(2) }
  it { expect { fib(3) }.to change { @cycles }.from(0).to(4) }
  it { expect { fib(4) }.to change { @cycles }.from(0).to(8) }
  it { expect { fib(5) }.to change { @cycles }.from(0).to(14) }

  it { expect { solution }.to output(output_sample).to_stdout }
end
