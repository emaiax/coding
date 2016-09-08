require_relative "../../spec_helper"
require_relative "googlon_word"

describe GooglonWord do
  context "constants" do
    it { expect(GooglonWord::FOO).to match_array %w(z g v h b) }
    it { expect(GooglonWord::ALPHABET).to match_array %w(q r v c h f t d b j m z k s n x w l g p) }
  end

  context "#methods" do
    describe "is preposition?" do
      it { expect(GooglonWord.new("usfn").preposition?).to be_truthy }
      it { expect(GooglonWord.new("ushfn").preposition?).to be_falsy }
    end

    describe "is verb?" do
      it { expect(GooglonWord.new("iusnkg").verb?).to be_falsy }
      it { expect(GooglonWord.new("iusnkjol").verb?).to be_truthy }
    end

    describe "is first person verb?" do
      it { expect(GooglonWord.new("iusnkg").first_person_verb?).to be_falsy }
      it { expect(GooglonWord.new("zusnkjol").first_person_verb?).to be_truthy }
    end

    describe "is beauty number?" do
      it { expect(GooglonWord.new("zhvj").beauty_number?).to be_falsy }
      it { expect(GooglonWord.new("hcvtlnm").beauty_number?).to be_truthy }
    end

    describe "<=>" do
      let(:last)  { GooglonWord.new("qqghh") }
      let(:first) { GooglonWord.new("qqwlwkzz") }

      it { expect(last <=> first).to eql(1) }
      it { expect(first <=> last).to eql(-1) }
    end
  end
end
