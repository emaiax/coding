=begin

A non-empty array A consisting of N integers is given. The product of triplet (P, Q, R) equates to A[P] * A[Q] * A[R] (0 ≤ P < Q < R < N).

For example, array A such that:

  A[0] = -3
  A[1] = 1
  A[2] = 2
  A[3] = -2
  A[4] = 5
  A[5] = 6

contains the following example triplets:

  (0, 1, 2), product is −3 * 1 * 2 = −6
  (1, 2, 4), product is 1 * 2 * 5 = 10
  (2, 4, 5), product is 2 * 5 * 6 = 60

Your goal is to find the maximal product of any triplet.

Write a function:

  def solution(a)

that, given a non-empty array A, returns the value of the maximal product of any triplet.

For example, given array A such that:

  A[0] = -3
  A[1] = 1
  A[2] = 2
  A[3] = -2
  A[4] = 5
  A[5] = 6

the function should return 60, as the product of triplet (2, 4, 5) is maximal.

Write an efficient algorithm for the following assumptions:

  - N is an integer within the range [3..100,000];
  - each element of array A is an integer within the range [−1,000..1,000].

Results:

   Test score: 100%
  - Correctness: 100%
  - Performance: 100%
  - Link: https://app.codility.com/demo/results/trainingK5NSFB-HD4/

=end

require_relative "../../../spec_helper"

def solution(a)
  a.sort!

  maxs = a[-1] * a[-2] * a[-3]

  if a[0] < 0 and a[1] < 0
    mins = a[0] * a[1] * a[-1]
  else
    mins = a[0] * a[1] * a[2]
  end

  [maxs, mins].max
end

RSpec.describe "MaxProductOfThree" do
  it { expect(solution([-3, 1, 2, -2, 5, 6])).to eql(60) }
  it { expect(solution([-5, -5, 0, 5, 4])).to eql(125) }
  it { expect(solution([-5, -4, 0, 5, 3])).to eql(100) }
  it { expect(solution(((-1000..-1).to_a + [1000]).to_a)).to eql(999_000_000) }
  it { expect(solution([10, 10, 10])).to eql(1_000) }
  it { expect(solution([1000, 1000, 1000])).to eql(1_000_000_000) }
  it { expect(solution([4, 7, 3, 2, 1, -3, -5])).to eql(105) }
  it { expect(solution([-4, -6, 3, 4, 5])).to eql(120) }
  it { expect(solution([-2, -3, -5, -6, 0])).to eql(0) }
  it { expect(solution([4, 5, 1, 0])).to eql(20) }
  it { expect(solution([-10, -2, -4])).to eql(-80) }

  context do
    let(:arr) { (-10..10).to_a * 2000 + [-1000, 500, -1] }

    it { expect(solution(arr)).to eql(5_000_000) }
  end

  context do
    let(:arr) { [-2] * 50_000 + [0] + [1] * 50_000 }

    it { expect(solution(arr)).to eql(4) }
  end

  context do
    let(:arr) { [-1000] * 50_000 + [-1000] * 50_000 }

    it { expect(solution(arr)).to eql(-1_000_000_000) }
  end

  context do
    let(:arr) { [-1000] * 50_000 + [0] + [-1000] * 50_000 }

    it { expect(solution(arr)).to eql(0) }
  end
end
