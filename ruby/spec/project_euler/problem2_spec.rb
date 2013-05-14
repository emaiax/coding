require 'spec_helper'
require './project_euler/problem2.rb'

describe Euler::Problem2 do
  subject { described_class }

  it { subject::FOUR_MILLION.should eql(4_000_000) }

  describe "na sequência fibonacci" do
    it "retorna os 10 primeiros termos começando por 1 e 2" do
      subject.fibonacci(10).should == [1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
    end

    it "encontra o maior termo até 4 milhões" do
      subject.find_biggest_term_upto(subject::FOUR_MILLION).should eql(32)
    end

    it "soma os números pares menores que 4 milhões" do
      subject.sum_of_even_terms_of_fibonacci(32).should == 4613732
    end
  end
end
