# URI Online Judge | 1168
# LED
# Unknown Author
# Timelimit: 1
#
# John wants to set up a panel containing different numbers of LEDs. He does not have many leds, he is not sure
# if he will be able to mount the desired number. Considering the configuration of the LEDs of the numbers below,
#     make an algorithm that helps John to discover the number of LEDs needed to set the value.
#
# Input
#
# The input contains an integer N, (1 ≤ N ≤ 2000) corresponding to the number of test cases, followed by N lines,
#   each line containing a number (1 ≤ V ≤ 10100) corresponding to the value that John wants to set with the leds.
#
# Output
#
# For each test case, print one line containing the number of LEDs that John needs to set the desired value, followed by the word "leds".
#
# Input Sample	Output Sample
# 3
# 115380        27 leds
# 2819311       29 leds
# 23456         25 leds
#
require_relative "../spec_helper.rb"
require_relative "uri_gets_counter_helper"

LED_COUNTER = { "0" => 6, "1" => 2, "2" => 5, "3" => 5, "4" => 4, "5" => 5, "6" => 6, "7" => 3, "8" => 7, "9" => 6 }

def led_counter(text)
  text.chars.map { |digit| LED_COUNTER[digit] }.reduce(&:+)
end

def solution
  gets.to_i.times do
    counter = led_counter(gets.chomp)
    puts "#{counter} leds\n"
  end
end

RSpec.describe "1168" do
  let(:input_sample) { ["3", "115380", "2819311", "23456", "959244954", ] }
  let(:output_sample) { "27 leds\n29 leds\n25 leds\n" }

  it { expect(led_counter("115380")).to eql(27) }
  it { expect(led_counter("2819311")).to eql(29) }
  it { expect(led_counter("23456")).to eql(25) }
  it { expect(led_counter((10**100).to_s)).to eql(602) }

  it { expect { solution }.to output(output_sample).to_stdout }
end
