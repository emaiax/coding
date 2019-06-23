=begin

Write a function

  def solution(a)

that, given an array A consisting of N integers, returns the number of distinct values in array A.

For example, given array A consisting of six elements such that:

  A[0] = 2    A[1] = 1    A[2] = 1
  A[3] = 2    A[4] = 3    A[5] = 1

the function should return 3, because there are 3 distinct values appearing in array A, namely 1, 2 and 3.

Write an efficient algorithm for the following assumptions:

  - N is an integer within the range [0..100,000];
  - each element of array A is an integer within the range [−1,000,000..1,000,000].

Results:

  - Test score: 100%
  - Correctness: 100%
  - Performance: 100%
  - Link: https://app.codility.com/demo/results/trainingZMNQWV-6PF/

=end

require_relative "../../../spec_helper"

def solution(a)
  found = {}

  a.each do |i|
    found[i] = true
  end

  found.count
end

RSpec.describe "Distinct" do
  it { expect(solution((0..100_000))).to eql(100_001) }
  it { expect(solution((-1_000_000..1_000_000))).to eql(2_000_001) }

  context do
    let(:arr) { (1..10).to_a * 100_000 }

    it { expect(solution(arr)).to eql(10) }
  end
end
