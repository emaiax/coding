=begin

Write a function:

  def solution(a)

that, given a non-empty zero-indexed array A of N integers, returns the minimal positive integer (greater than 0) that does not occur in A.

For example, given:

  A[0] = 1
  A[1] = 3
  A[2] = 6
  A[3] = 4
  A[4] = 1
  A[5] = 2

the function should return 5.

Assume that:

  - N is an integer within the range [1..100,000];
  - each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].

Complexity:

  - expected worst-case time complexity is O(N);
  - expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).

Elements of input arrays can be modified.

Results:

  - Test score: 100%
  - Correctness: 100%
  - Performance: 100%
  - Link: https://codility.com/demo/results/trainingNFVDBH-AW9/

=end

require_relative "../../../spec_helper"

def solution(a)
  arr = a.sort.uniq.reject { |i| i < 1 }
  x = 1

  arr.each do |i|
    return x unless x == i

    x += 1
  end

  x
end

RSpec.describe "MissingInteger" do
  it { expect(solution([1])).to eql(2) }
  it { expect(solution([2])).to eql(1) }
  it { expect(solution([0])).to eql(1) }
  it { expect(solution([-1])).to eql(1) }

  it { expect(solution([4, 1, 3])).to eql(2) }
  it { expect(solution([4, 1, 3, 2])).to eql(5) }
  it { expect(solution([90, 91, 92, 93])).to eql(1) }

  it { expect(solution([1, 3, 6, 4, 1, 2])).to eql(5) }

  it { expect(solution((1..100_000).to_a.shuffle)).to eql(100_001) }
  it { expect(solution((2..100_000).to_a.shuffle)).to eql(1) }

  it { expect(solution([2147483648, 2147483647])).to eql(1) }
  it { expect(solution([1, 2, 3, 1, 1, 2, 4, 5, -2147483648, 2147483647])).to eql(6) }

  it { expect(solution((-100..-1).to_a.shuffle)).to eql(1) }

  it { expect(solution((0..200).reject { |i| i == 101 }.shuffle)).to eql(101) }
end
