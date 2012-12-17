require 'spec_helper'

describe GooglonWord do
  context "constants" do
    it { GooglonWord::FOO.should == %w(z g v h b) }
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
  end
end
