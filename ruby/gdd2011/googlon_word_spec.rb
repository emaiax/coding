require 'pry'
require_relative '../spec_helper'
require_relative 'googlon_word'

describe GooglonWord do
  context "constants" do
    it { GooglonWord::FOO.should == %w(z g v h b) }
    it { GooglonWord::ALPHABET.should == %(q r v c h f t d b j m z k s n x w l g p) }
  end

  context "#methods" do
    describe "is preposition?" do
      it "should return true" do
        GooglonWord.new("usfn").preposition?.should be_true
      end

      it "should return false" do
        GooglonWord.new("ushfn").preposition?.should be_false
      end
    end

    describe "is verb?" do
      it "should return true" do
        GooglonWord.new("iusnkjol").verb?.should be_true
      end

      it "should return false" do
        GooglonWord.new("iusnkg").verb?.should be_false
      end
    end

    describe "is first person verb?" do
      it "should return true" do
        GooglonWord.new("zusnkjol").first_person_verb?.should be_true
      end

      it "should return false" do
        GooglonWord.new("iusnkg").first_person_verb?.should be_false
      end
    end

    describe "as number" do
      it "should return number value" do
        GooglonWord.new("zhvk").to_i.should == 96891
      end
    end

    describe "is beauty number?" do
      it "should return true" do
        GooglonWord.new("hcvtlnm").beauty_number?.should be_true
      end

      it "should return true" do
        GooglonWord.new("zhvj").beauty_number?.should be_false
      end
    end
  end
end
