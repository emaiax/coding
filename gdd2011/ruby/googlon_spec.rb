require_relative "../../spec_helper"
require_relative "googlon"
require_relative "googlon_word"

def load_file(file)
  File.read("#{File.dirname(__FILE__)}/#{file}")
end

describe Googlon do
  let(:text_a) { load_file("fixtures/text_a.txt") }
  let(:text_b) { load_file("fixtures/text_b.txt") }

  let(:vocabulary_a) { load_file("fixtures/vocabulary_a.txt") }
  let(:vocabulary_b) { load_file("fixtures/vocabulary_b.txt") }

  context "#methods" do
    describe "prepositions" do
      it { expect(Googlon.new(text_a).prepositions.count).to eql(62) }
      it { expect(Googlon.new(text_b).prepositions.count).to eql(65) }
    end

    describe "verbs" do
      it { expect(Googlon.new(text_a).verbs.count).to eql(67) }
      it { expect(Googlon.new(text_b).verbs.count).to eql(83) }
    end

    describe "first person verbs" do
      it { expect(Googlon.new(text_a).first_person_verbs.count).to eql(15) }
      it { expect(Googlon.new(text_b).first_person_verbs.count).to eql(21) }
    end

    describe "beauty numbers" do
      it { expect(Googlon.new(text_a).beauty_numbers.uniq.count).to eql(83) }
      it { expect(Googlon.new(text_b).beauty_numbers.uniq.count).to eql(81) }
    end

    describe "text_a.unique_sorted_text equals vocabulary_a" do
      it { expect(Googlon.new(text_a).sorted_text).to eql vocabulary_a.chomp }
      it { expect(Googlon.new(text_b).sorted_text).to eql vocabulary_b.chomp }
    end
  end
end
