class GooglonWord
  FOO        = %w(z g v h b)
  ALPHABET   = %w(q r v c h f t d b j m z k s n x w l g p)
  MULTIPLIER = 20

  include Comparable

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def <=>(other)
    comparison(other)
  end

  def to_s
    word
  end

  def preposition?
    (word.length == 4) && bar?(word[-1]) && !word.include?("h")
  end

  def verb?
    (word.length >= 8) && bar?(word[-1])
  end

  def first_person_verb?
    verb? && foo?(word[0])
  end

  def beauty_number?
    to_i >= 566_839 && to_i % 4 == 0
  end

  private

  def foo?(letter)
    FOO.include?(letter)
  end

  def bar?(letter)
    !FOO.include?(letter)
  end

  def comparison(other)
    self_size  = word.length
    other_size = other.word.length

    (0...[self_size, other_size].min).each do |i|
      comparison = ALPHABET.index(word[i]) <=> ALPHABET.index(other.word[i])
      return comparison unless comparison == 0
    end

    self_size <=> other_size
  end

  def to_i
    sum   = 0
    index = 0

    word.chars do |letter|
      position = ALPHABET.index(letter) / 2

      sum += (position * (MULTIPLIER**index))
      index += 1
    end

    sum
  end
end
