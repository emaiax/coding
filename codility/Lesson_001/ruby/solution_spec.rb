require_relative "../../spec_helper"

def solution(n)
  n.to_s(2).scan(/(?<=1)0+(?=1)/).map(&:length).max || 0
end

RSpec.describe "BinaryGap" do
  it { expect(solution(9)).to eql(2) }
  it { expect(solution(529)).to eql(4) }
  it { expect(solution(20)).to eql(1) }
  it { expect(solution(15)).to eql(0) }
  it { expect(solution(1_041)).to eql(5) }
  it { expect(solution(1_610_612_737)).to eql(28) }
end
