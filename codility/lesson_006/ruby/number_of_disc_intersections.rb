=begin

We draw N discs on a plane. The discs are numbered from 0 to N − 1. An array A of N non-negative integers, specifying the radiuses of the discs, is given.
The J-th disc is drawn with its center at (J, 0) and radius A[J].

We say that the J-th disc and K-th disc intersect if J ≠ K and the J-th and K-th discs have at least one common point (assuming that the discs contain their borders).

The figure below shows discs drawn for N = 6 and A as follows:

  A[0] = 1
  A[1] = 5
  A[2] = 2
  A[3] = 1
  A[4] = 4
  A[5] = 0

There are eleven (unordered) pairs of discs that intersect, namely:

  - discs 1 and 4 intersect, and both intersect with all the other discs;
  - disc 2 also intersects with discs 0 and 3.

Write a function:

  def solution(a)

that, given an array A describing N discs as explained above, returns the number of (unordered) pairs of intersecting discs.
The function should return −1 if the number of intersecting pairs exceeds 10,000,000.

Given array A shown above, the function should return 11, as explained above.

Write an efficient algorithm for the following assumptions:

  - N is an integer within the range [0..100,000];
  - each element of array A is an integer within the range [0..2,147,483,647].

Results:

  - Test score: 100%
  - Correctness: 100%
  - Performance: 100%
  - Link: https://app.codility.com/demo/results/training4ZE52Y-GJQ/

=end

require_relative "../../../spec_helper"

def solution(a)
  positions = []
  open_discs = 0
  intersections = 0

  discs = { openings: [], closures: [] }

  a.each.with_index do |radius, disc|
    opening = disc - radius
    closure = disc + radius

    positions << opening
    positions << closure

    discs[:openings] << opening
    discs[:closures] << closure
  end

  positions.sort!
  discs.each_value(&:sort!)

  positions.each.with_index do |position, index|
    while discs[:openings][0] == position
      discs[:openings].shift

      intersections += open_discs
      open_discs += 1
    end

    while discs[:closures][0] == position
      discs[:closures].shift

      open_discs -= 1
    end
  end

  intersections <= 10_000_000 ? intersections : -1
end

RSpec.describe "NumberOfDiscIntersections" do
  it { expect(solution([])).to eql(0) }
  it { expect(solution([0])).to eql(0) }
  it { expect(solution([1])).to eql(0) }
  it { expect(solution([0, 0])).to eql(0) }
  it { expect(solution([1, 3])).to eql(1) }
  it { expect(solution([1, 0, 1, 0, 1])).to eql(6) }
  it { expect(solution([1, 5, 2, 1, 4, 0])).to eql(11) }
  it { expect(solution([0] * 2000)).to eql(0) }
end
