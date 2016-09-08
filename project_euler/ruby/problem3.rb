# Largest prime factor
#
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

require 'prime'

module Euler
  class Problem3
    class << self
      def primes_of(number)
        Prime.prime_division(number).flatten.uniq.sort
      end
    end
  end
end
