class GooglonWord
  FOO = %w(z g v h b)
  ALPHABET = %(q r v c h f t d b j m z k s n x w l g p)
  MULTIPLIER = 20

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def to_i
    sum, index = 0, 0

    word.chars do |letter|
      # encontra o valor representado da letra a partir do alfabeto
      #
      position = ALPHABET.index(letter) / 2

      # multiplica a posição pelo índice
      #
      sum += (position * (MULTIPLIER ** index))
      index += 1
    end

    return sum
  end

  #
  # as preposições são as palavras de 4 letras
  # que terminam numa letra tipo bar,
  # mas onde não ocorre a letra h.
  #
  def preposition?
    (word.length == 4) && bar?(word[-1]) && !word.include?("h")
  end

  #
  # os verbos sempre são palavras de 8 ou mais letras
  # que terminam numa letra tipo bar.
  # Além disso, se um verbo começa com uma letra tipo foo, o verbo está em primeira pessoa.
  #
  def verb?
    (word.length >= 8) && bar?(word[-1])
  end

  def first_person_verb?
    return verb? && foo?(word[0])
  end

  private

  #
  # verifica se a letra é do tipo FOO
  #
  def foo?(letter)
    FOO.include? letter
  end

  #
  # verifica se a letra não é do tipo FOO
  #
  def bar?(letter)
    not FOO.include? letter
  end
end
