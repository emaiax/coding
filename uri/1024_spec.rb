# URI Online Judge | 1024
# Encryption
# By Neilor Tonin, URI  Brazil
# Timelimit: 1
#
# You have been asked to build a simple encryption program. This program should be able to send coded messages without
# someone been able to read them. The process is very simple. It is divided into two parts. 
#
# First, each uppercase or lowercase letter must be shifted three positions to the right, according to the ASCII table:
# letter 'a' should become letter 'd', letter 'y' must become the character '|' and so on. Second, each line must be reversed.
# After being reversed, all characters from the half on (truncated) must be moved one position to the left in ASCII.
# In this case, 'b' becomes 'a' and 'a' becomes '`'. 
#
# For example, if the resulting word of the first part is "tesla", the letters "sla" should be moved one position to the left.
# However, if the resulting word of the first part is "t#$A", the letters "$A" are to be displaced.
#
# Input
#
# The input contains a number of cases of test. The first line of each case of test contains an integer N (1 ≤ N ≤ 1 * 10⁴),
# indicating the number of lines the problem should encrypt. The following N lines contain M characters each M (1 ≤ M ≤ 1 * 10³).
#
# Output
#
# For each input, you must present the encrypted message.
#
# Input Sample	Output Sample
# 4
# Texto #3      3# rvzgV
# abcABC1       1FECedc
# vxpdylY .ph   ks. \n{frzx
# vv.xwfxo.fd   gi.r{hyz-xx

require_relative "../spec_helper.rb"
require_relative "uri_gets_counter_helper"

def encrypt(text)
  encrypted = text.chars.map { |letter| letter =~ /[[:alpha:]]/ ? (letter.ord + 3).chr : letter }.join.reverse

  half_on = encrypted.length / 2

  encrypted.chars.map.with_index { |letter, index| index >= half_on ? (letter.ord - 1).chr : letter }.join
end

def solution
  1.upto(gets.to_i) do
    puts encrypt(gets.chomp)
  end
end

RSpec.describe "1024" do
  let(:input_sample)  { ["4", "Texto #3", "abcABC1", "vxpdylY .ph", "vv.xwfxo.fd"] }
  let(:output_sample) { "3# rvzgV\n1FECedc\nks. \\n{frzx\ngi.r{hyz-xx\n" }

  it { expect(encrypt("Texto #3")).to eql("3# rvzgV") }
  it { expect(encrypt("abcABC1")).to eql("1FECedc") }
  it { expect(encrypt("vxpdylY .ph")).to eql("ks. \\n{frzx") }
  it { expect(encrypt("vv.xwfxo.fd")).to eql("gi.r{hyz-xx") }

  it { expect { solution }.to output(output_sample).to_stdout }
end
