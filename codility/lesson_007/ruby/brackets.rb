=begin

A string S consisting of N characters is considered to be properly nested if any of the following conditions is true:

  - S is empty;
  - S has the form "(U)" or "[U]" or "{U}" where U is a properly nested string;
  - S has the form "VW" where V and W are properly nested strings.
  - For example, the string "{[()()]}" is properly nested but "([)()]" is not.

Write a function:

  def solution(s)

that, given a string S consisting of N characters, returns 1 if S is properly nested and 0 otherwise.

For example, given S = "{[()()]}", the function should return 1 and given S = "([)()]", the function should return 0, as explained above.

Write an efficient algorithm for the following assumptions:

  - N is an integer within the range [0..200,000];
  - string S consists only of the following characters: "(", "{", "[", "]", "}" and/or ")".

Results:

  - Test score: 100%
  - Correctness: 100%
  - Performance: 100%
  - Link: https://app.codility.com/demo/results/trainingP2RXKQ-ADY/

=end

require_relative "../../../spec_helper"

def solution(s)
  return 1 if s.empty?
  return 0 if s.length % 2 != 0

  pairs = {}

  s.chars.each.with_index do |char, index|
    case char
    when "(" then return 0 if s[index + 1] =~ /(\)|\]|\})/ and s[index + 1] != ")"
    when "[" then return 0 if s[index + 1] =~ /(\)|\]|\})/ and s[index + 1] != "]"
    when "{" then return 0 if s[index + 1] =~ /(\)|\]|\})/ and s[index + 1] != "}"
    end

    case char
    when "(" then pairs["("] = pairs["("].to_i + 1
    when "[" then pairs["["] = pairs["["].to_i + 1
    when "{" then pairs["{"] = pairs["{"].to_i + 1
    end

    case char
    when ")" then pairs["("] = pairs["("].to_i - 1
    when "]" then pairs["["] = pairs["["].to_i - 1
    when "}" then pairs["{"] = pairs["{"].to_i - 1
    end

    return 0 if (pairs["("].to_i < 0 or pairs["["].to_i < 0 or pairs["{"].to_i < 0)
  end

  pairs.values.max > 0 ? 0 : 1
end

RSpec.describe "Brackets" do
  it { expect(solution("")).to eql(1) }
  it { expect(solution("([)()]")).to eql(0) }
  it { expect(solution("{[()()]}")).to eql(1) }
  it { expect(solution("{}[](){}[])(")).to eql(0) }
  it { expect(solution("{}[](){}[]()")).to eql(1) }
  it { expect(solution("[({(([{}{}]))})]")).to eql(1) }

  it do
    s = ("(" * 10_001) + (")" * 10_000) + ")(()"

    expect(solution(s)).to eql(0)
  end

  it do
    s = ("(" * 100_000) + (")" * 100_000) + "()"

    expect(solution(s)).to eql(1)
  end
end
