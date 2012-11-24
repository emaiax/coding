require 'spec_helper'

describe Googlon do
  context "constants" do
    it { Googlon::FOO.should == %w(z g v h b) }
    it { Googlon::BAR.should == %w(a c d e f i j k l m n o p q r s t u x y w) }
  end

  context "foo/bar" do
    it "its a foo letter" do
      Googlon::FOO.each do |letter|
        Googlon.foo?(letter).should be_true
      end
    end

    it "its a bar letter" do
      Googlon::BAR.each do |letter|
        Googlon.bar?(letter).should be_true
      end
    end
  end

  context "prepositions" do
    it "should have 62 prepositions in text a" do
      text_a = File.read("spec/fixtures/text_a.txt")

      preps = 0
      text_a.split(" ").each do |word|
        preps +=1 if Googlon.is_preposition?(word)
      end

      preps.should eql(62)
    end

    it "should have 65 prepositions in text b" do
      text_b = File.read("spec/fixtures/text_b.txt")

      preps = 0
      text_b.split(" ").each do |word|
        preps += 1 if Googlon.is_preposition?(word)
      end

      preps.should eql(65)
    end
  end
end
