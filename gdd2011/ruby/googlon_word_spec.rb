require_relative '../spec_helper'
require_relative 'googlon_word'

describe GooglonWord do
  context "constants" do
    it { GooglonWord::FOO.should      eql %w(z g v h b) }
    it { GooglonWord::ALPHABET.should eql %(q r v c h f t d b j m z k s n x w l g p) }
  end

  context "#methods" do
    describe "is preposition?" do
      it { expect(GooglonWord.new("usfn").preposition?).to be_true }
      it { expect(GooglonWord.new("ushfn").preposition?).to be_false }
    end

    describe "is verb?" do
      it { expect(GooglonWord.new("iusnkjol").verb?).to be_true }
      it { expect(GooglonWord.new("iusnkg").verb?).to be_false }
    end

    describe "is first person verb?" do
      it { expect(GooglonWord.new("zusnkjol").first_person_verb?).to be_true }
      it { expect(GooglonWord.new("iusnkg").first_person_verb?).to be_false }
    end

    describe "is beauty number?" do
      it { expect(GooglonWord.new("hcvtlnm").beauty_number?).to be_true }
      it { expect(GooglonWord.new("zhvj").beauty_number?).to be_false }
    end

    describe "<=>" do
      let(:last)  { GooglonWord.new("qqghh") }
      let(:first) { GooglonWord.new("qqwlwkzz") }

      it { expect(last <=> first).to eql(1) }
      it { expect(first <=> last).to eql(-1) }
    end
  end
end
