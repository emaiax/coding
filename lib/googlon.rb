class Googlon
  FOO = %w(z g v h b)
  BAR = %w(a c d e f i j k l m n o p q r s t u x y w)

  def self.foo?(letter)
    FOO.include? letter
  end

  def self.bar?(letter)
    BAR.include? letter
  end

  #
  # as preposições são as palavras de 4 letras
  # que terminam numa letra tipo bar,
  # mas onde não ocorre a letra h.
  #
  def self.is_preposition?(word)
    arr = word.split('')
    return (arr.length == 4) && bar?(arr.last) && !arr.include?("h")
  end
end
