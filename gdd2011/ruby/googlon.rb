class Googlon
  attr_reader :text

  def initialize(text)
    @text = text.split(" ").map do |word|
      GooglonWord.new(word)
    end
  end

  def prepositions
    text.select(&:preposition?)
  end

  def verbs
    text.select(&:verb?)
  end

  def first_person_verbs
    text.select(&:first_person_verb?)
  end

  def beauty_numbers
    text.select(&:beauty_number?)
  end

  def lexical_sort
    text.sort{ |x, y| x <=> y }
  end

  def sorted_text
    lexical_sort.uniq.map(&:to_s).join(" ")
  end
end
