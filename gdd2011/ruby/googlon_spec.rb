require_relative '../spec_helper'
require_relative 'googlon'
require_relative 'googlon_word'

describe Googlon do
  let(:text_a) { File.read("gdd2011/fixtures/text_a.txt") }
  let(:text_b) { File.read("gdd2011/fixtures/text_b.txt") }
  let(:vocabulary_a) { File.read("gdd2011/fixtures/vocabulary_a.txt") }
  let(:vocabulary_b) { File.read("gdd2011/fixtures/vocabulary_b.txt") }

  context "#methods" do
    describe "prepositions" do
      it { expect(Googlon.new(text_a).prepositions).to have(62).items }
      it { expect(Googlon.new(text_b).prepositions).to have(65).items }
    end

    describe "verbs" do
      it { expect(Googlon.new(text_a).verbs).to have(67).items }
      it { expect(Googlon.new(text_b).verbs).to have(83).items }
    end

    describe "first person verbs" do
      it { expect(Googlon.new(text_a).first_person_verbs).to have(15).items }
      it { expect(Googlon.new(text_b).first_person_verbs).to have(21).items }
    end

    describe "beauty numbers" do
      it { expect(Googlon.new(text_a).beauty_numbers.uniq).to have(83).items }
      it { expect(Googlon.new(text_b).beauty_numbers.uniq).to have(81).items }
    end

    describe "text_a.unique_sorted_text equals vocabulary_a" do
      it { expect(Googlon.new(text_a).sorted_text).to eql vocabulary_a.chomp }
      it { expect(Googlon.new(text_b).sorted_text).to eql vocabulary_b.chomp }
    end
  end
end
