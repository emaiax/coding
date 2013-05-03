require 'spec_helper'
require './project_euler/problem1.rb'

describe Euler::Problem1 do
  subject { described_class }

  describe "múltiplos de 3 ou 5" do
    context "até 10" do
      it "retorna os múltiplos de 3" do
        subject.multiples_of_3(10).should == [3, 6, 9]
      end

      it "retorna os múltiplos de 5" do
        subject.multiples_of_5(10).should == [5]
      end

      it "retorna os múltiplos de 3 ou 5" do
        subject.multiples_of_3_or_5(10).should == [3, 5, 6, 9]
      end

      it "retorna a soma dos múltiplos de 3 ou 5" do
        subject.sum_of_multiples_of_3_or_5(10).should eql(23)
      end
    end

    context "até 1000" do
      it "retorna a soma dos múltiplos de 3 ou 5" do
        subject.sum_of_multiples_of_3_or_5(1000).should eql(233168)
      end
    end
  end
end
