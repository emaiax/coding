class Googlon
  FOO = %w(z g v h b)
  BAR = %w(a c d e f i j k l m n o p q r s t u x y w)

  #
  # verifica se a letra é do tipo FOO
  #
  def self.is_foo?(letter)
    FOO.include? letter
  end

  #
  # verifica se a letra é do tipo FOO
  #
  def self.is_bar?(letter)
    BAR.include? letter
  end

  #
  # as preposições são as palavras de 4 letras
  # que terminam numa letra tipo bar,
  # mas onde não ocorre a letra h.
  #
  def self.is_preposition?(word)
    arr = word.split('')
    return (arr.length == 4) && is_bar?(arr.last) && !arr.include?("h")
  end

  #
  # os verbos sempre são palavras de 8 ou mais letras
  # que terminam numa letra tipo bar.
  # Além disso, se um verbo começa com uma letra tipo foo, o verbo está em primeira pessoa.
  #
  def self.is_verb?(word)
    arr = word.split('')
    return (arr.length >= 8) && is_bar?(arr.last)
  end

  def self.is_first_person_verb?(word)
    arr = word.split('')
    return is_verb?(word) && is_foo?(arr.first)
  end
end
