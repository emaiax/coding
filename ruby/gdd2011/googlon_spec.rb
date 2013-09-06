require_relative '../spec_helper'
require_relative 'googlon'

describe Googlon do
  let(:text_a) { File.read("gdd2011/fixtures/text_a.txt") }
  let(:text_b) { File.read("gdd2011/fixtures/text_b.txt") }
  let(:vocabulary_a) { File.read("gdd2011/fixtures/text_b.txt") }

  context "#methods" do
    it "should find prepositions" do
      Googlon.new(text_a).prepositions.should have(62).items
      Googlon.new(text_b).prepositions.should have(65).items
    end

    it "should find verbs" do
      Googlon.new(text_a).verbs.should have(67).items
      Googlon.new(text_b).verbs.should have(83).items
    end

    it "should find first person verbs" do
      Googlon.new(text_a).first_person_verbs.should have(15).items
      Googlon.new(text_b).first_person_verbs.should have(21).items
    end

    it "should find beauty numbers" do
      Googlon.new(text_a).beauty_numbers.uniq.should have(83).items
      Googlon.new(text_b).beauty_numbers.uniq.should have(81).items
    end
  end
end
