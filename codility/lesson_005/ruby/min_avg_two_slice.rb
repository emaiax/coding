=begin

A non-empty zero-indexed array A consisting of N integers is given. A pair of integers (P, Q), such that 0 ≤ P < Q < N, is called a slice of array A (notice that the slice contains at least two elements). The average of a slice (P, Q) is the sum of A[P] + A[P + 1] + ... + A[Q] divided by the length of the slice. To be precise, the average equals (A[P] + A[P + 1] + ... + A[Q]) / (Q − P + 1).

For example, array A such that:

    A[0] = 4
    A[1] = 2
    A[2] = 2
    A[3] = 5
    A[4] = 1
    A[5] = 5
    A[6] = 8

contains the following example slices:

  - slice (1, 2), whose average is (2 + 2) / 2 = 2;
  - slice (3, 4), whose average is (5 + 1) / 2 = 3;
  - slice (1, 4), whose average is (2 + 2 + 5 + 1) / 4 = 2.5.

The goal is to find the starting position of a slice whose average is minimal.

Write a function:

  def solution(a)

that, given a non-empty zero-indexed array A consisting of N integers, returns the starting position of the slice with the minimal average. If there is more than one slice with a minimal average, you should return the smallest starting position of such a slice.

For example, given array A such that:

    A[0] = 4
    A[1] = 2
    A[2] = 2
    A[3] = 5
    A[4] = 1
    A[5] = 5
    A[6] = 8

the function should return 1, as explained above.

Assume that:

  - N is an integer within the range [2..100,000];
  - each element of array A is an integer within the range [−10,000..10,000].

Complexity:

  - expected worst-case time complexity is O(N);
  - expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).

Results:

  - Test score: 80%
  - Correctness: 100%
  - Performance: 60%
  - Link: https://codility.com/demo/results/trainingJT9EX7-CMH/

=end

require_relative "../../../spec_helper"

def solution(a)
  size      = a.size
  min_avg   = 10_000
  min_index = 0

  (0..size - 2).each do |index|
    if index - 1 < size
      slice_of_2 = (a[index].to_f + a[index + 1].to_f) / 2.to_f

      if min_avg > slice_of_2
        min_avg   = slice_of_2
        min_index = index
      end
    end

    if index - 2 < size
      slice_of_3 = (a[index].to_f + a[index + 1].to_f + a[index + 2].to_f) / 3.to_f

      if min_avg > slice_of_3
        min_avg   = slice_of_3
        min_index = index
      end
    end
  end

  min_index
end

RSpec.describe "MinAvgTwoSlice" do
  it { expect(solution([4, 2, 2, 5, 1, 5, 8])).to eql(1) }
  it { expect(solution([-3, -5, -8, -4, -10])).to eql(2) }

  it { expect(solution([-10000, -10000])).to eql(0) }
  it { expect(solution([10000, -10000])).to eql(0) }
  it { expect(solution([10000, -10000])).to eql(0) }
  it { expect(solution([10000, -10000, -10000, 10000])).to eql(1) }

  it { expect(solution([5, 6, 3, 4, 9])).to eql(2) }
  it { expect(solution([10, 10, -1, 2, 4, -1, 2, -1])).to eql(5) }
  it { expect(solution([-3, -5, -8, -4, -10])).to eql(2) }

  it { expect(solution([9330, -1185, -9851, 8220, 8786, 1645, 3431, -8322, 5330, -5264, -9384, 5776, -3078, 2466, 2316, -7029, -6339, -7712, -9708, -265, 9298, -8709, 822, -682, 2029, -8222, 1580, -4609, 1129, 2893, -379, -2895, -5017, 8671, -932, 603, -9614, 162, -9885, -7125, -543, -2453, -8917, 1751, -6720, 1147, -7115, 8747, 5420, 9139, -7176, -3892, -9209, -4465, 6131, -6453, -6909, 9095, -6909, 6678, -9179, -2276, -3008, -3166, 6330, -481, 5658, -583, 6347, 7632, -1208, 5622, 6295, -4087, -7523, -6288, -1279, -7611, 596, 6589, -296, 6355, 3128, 2821, -3093, 4053, 6199, -6857, 8160, -4614, -6903, 6810, 4403, 5872, -1067, -8585, -2095, -9046, -4278, -9241])).to eql(17) }

  it { expect(solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100])).to eql(0) }
  it { expect(solution([103, 102, 101, 100, 99, 98, 97, 96, 95, 94, 93, 92, 91, 90, 89, 88, 87, 86, 85, 84, 83, 82, 81, 80, 79, 78, 77, 76, 75, 74, 73, 72, 71, 70, 69, 68, 67, 66, 65, 64, 63, 62, 61, 60, 59, 58, 57, 56, 55, 54, 53, 52, 51, 50, 49, 48, 47, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2])).to eql(100) }
  it { expect(solution([-3, -3, 10, -10, 10, -10, 10, -10, 10, -3, -3, 100, -11])).to eql(3) }
end
