=begin

A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps.

Write a function:

  def solution(n)

that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.

For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5.

Assume that:

N is an integer within the range [1..2,147,483,647].

Complexity:

 - expected worst-case time complexity is O(log(N));
 - expected worst-case space complexity is O(1).

Results:

  - Test score: 100%
  - Correctness: 100%
  - Performance: not assessed
  - Link: https://codility.com/demo/results/trainingMCHJFW-465/

=end

require_relative "../../../spec_helper"

def solution(n)
  n.to_s(2).scan(/(?<=1)0+(?=1)/).map(&:length).max || 0
end

RSpec.describe "BinaryGap" do
  it { expect(solution(9)).to eql(2) }
  it { expect(solution(529)).to eql(4) }
  it { expect(solution(20)).to eql(1) }
  it { expect(solution(15)).to eql(0) }
  it { expect(solution(1_041)).to eql(5) }
  it { expect(solution(1_610_612_737)).to eql(28) }
end
