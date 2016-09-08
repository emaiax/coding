# Multiples of 3 and 5
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

module Euler
  class Problem1
    class << self
      def multiples_of_3(number)
        (1...number).select { |i| i % 3 == 0 }
      end

      def multiples_of_5(number)
        (1...number).select { |i| i % 5 == 0 }
      end

      def multiples_of_3_or_5(number)
        (multiples_of_3(number) | multiples_of_5(number)).sort
      end

      def sum_of_multiples_of_3_or_5(number)
        multiples_of_3_or_5(number).inject(&:+)
      end
    end
  end
end
