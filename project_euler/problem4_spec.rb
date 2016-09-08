require_relative 'problem4.rb'
require_relative '../spec_helper'

describe Euler::Problem4 do
  subject { described_class }

  describe "números palíndromos" do
    it "retorna o maior palíndromo dos produtos de números de 2 dígitos (até 99)" do
      subject.palindromes_of_multiples_up_to(99).last.should eql(9009)
    end

    it "retorna o maior palíndromo dos produtos de números de 3 dígitos (até 999)" do
      subject.palindromes_of_multiples_up_to(999).last.should eql(906609)
    end
  end
end
