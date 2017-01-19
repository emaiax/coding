=begin

Write a function:

def solution(a, b, k)

that, given three integers A, B and K, returns the number of integers within the range [A..B] that are divisible by K, i.e.:

  { i : A ≤ i ≤ B, i mod K = 0 }

For example, for A = 6, B = 11 and K = 2, your function should return 3, because there are three numbers divisible by 2 within the range [6..11], namely 6, 8 and 10.

Assume that:

 - A and B are integers within the range [0..2,000,000,000];
 - K is an integer within the range [1..2,000,000,000];
 - A ≤ B.

Complexity:

 - expected worst-case time complexity is O(1);
 - expected worst-case space complexity is O(1).

Results:

  - Test score: 100%
  - Correctness: 100%
  - Performance: 100%
  - Link: https://codility.com/demo/results/trainingHSQAFF-NK6/

=end

require_relative "../../../spec_helper"

def solution(a, b, k)
  b / k - (a - 1) / k
end

RSpec.describe "CountDiv" do
  it { expect(solution(6, 11, 2)).to                           eql(3) }

  it { expect(solution(11, 345, 17)).to                        eql(20) }

  it { expect(solution(1, 1, 11)).to                           eql(0) }
  it { expect(solution(0, 0, 11)).to                           eql(1) }

  it { expect(solution(10, 10, 7)).to                          eql(0) }
  it { expect(solution(10, 10, 5)).to                          eql(1) }
  it { expect(solution(10, 10, 20)).to                         eql(0) }

  it { expect(solution(10, 14, 2)).to                          eql(3) }
  it { expect(solution(11, 14, 2)).to                          eql(2) }
  it { expect(solution(10, 13, 2)).to                          eql(2) }
  it { expect(solution(0, 14, 2)).to                           eql(8) }
  it { expect(solution(0, 13, 2)).to                           eql(7) }

  it { expect(solution(1, 500, 12)).to                         eql(41) }

  it { expect(solution(100, 123456789, 2)).to                  eql(61728345) }
  it { expect(solution(101, 123456789, 10000)).to              eql(12345) }

  it { expect(solution(0, 2000000000, 1)).to                   eql(2000000001) }
  it { expect(solution(0, 2000000000, 2000000000)).to          eql(2) }

  it { expect(solution(1, 1, 1)).to                            eql(1) }
  it { expect(solution(1, 2000000000, 1)).to                   eql(2000000000) }

  it { expect(solution(2000000000, 2000000000, 1)).to          eql(1) }
  it { expect(solution(2000000000, 2000000000, 2000000000)).to eql(1) }
end
