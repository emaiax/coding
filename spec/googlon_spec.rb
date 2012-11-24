require 'spec_helper'

describe Googlon do
  let(:text_a) { File.read("spec/fixtures/text_a.txt") }
  let(:text_b) { File.read("spec/fixtures/text_b.txt") }

  context "constants" do
    it { Googlon::FOO.should == %w(z g v h b) }
    it { Googlon::BAR.should == %w(a c d e f i j k l m n o p q r s t u x y w) }
  end

  context "foo/bar" do
    it "its a foo letter" do
      Googlon::FOO.each do |letter|
        Googlon.is_foo?(letter).should be_true
      end
    end

    it "its a bar letter" do
      Googlon::BAR.each do |letter|
        Googlon.is_bar?(letter).should be_true
      end
    end
  end

  context "prepositions" do
    it "should have 62 prepositions in text a" do
      preps = 0
      text_a.split(" ").each do |word|
        preps +=1 if Googlon.is_preposition?(word)
      end

      preps.should eql(62)
    end

    it "should have 65 prepositions in text b" do
      preps = 0
      text_b.split(" ").each do |word|
        preps += 1 if Googlon.is_preposition?(word)
      end

      preps.should eql(65)
    end
  end

  context "verbs" do
    describe "common verbs" do
      it "should have 67 verbs in text a" do
        verbs = 0
        text_a.split(" ").each do |word|
          verbs +=1 if Googlon.is_verb?(word)
        end

        verbs.should eql(67)
      end

      it "should have 67 verbs in text b" do
        verbs = 0
        text_b.split(" ").each do |word|
          verbs +=1 if Googlon.is_verb?(word)
        end

        verbs.should eql(83)
      end
    end

    describe "first person verbs" do
      it "should have 15 first person verbs in text a" do
        verbs = 0
        text_a.split(" ").each do |word|
          verbs +=1 if Googlon.is_first_person_verb?(word)
        end

        verbs.should eql(15)
      end

      it "should have 15 first person verbs in text b" do
        verbs = 0
        text_b.split(" ").each do |word|
          verbs +=1 if Googlon.is_first_person_verb?(word)
        end

        verbs.should eql(21)
      end
    end
  end
end
