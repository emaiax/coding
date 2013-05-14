require 'spec_helper'
require './project_euler/problem3.rb'

describe Euler::Problem3 do
  subject { described_class }

  describe "primos" do
    it "retorna os números primos de 13195" do
      subject.primes_of(13195).should == [1, 5, 7, 13, 29]
    end

    it "retorna o maior número primo de 600851475143" do
      subject.primes_of(600851475143).last.should eql(6857)
    end
  end
end
