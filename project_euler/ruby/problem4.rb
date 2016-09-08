# Largest palindrome product
#
# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

module Euler
  class Problem4
    class << self
      def palindromes_of_multiples_up_to(term)
        [].tap do |arr|
          (1..term).each do |n|
            (1..n).each do |i|
              arr << n*i if (n*i).to_s == (n*i).to_s.reverse
            end
          end
        end.uniq.sort
      end
    end
  end
end
