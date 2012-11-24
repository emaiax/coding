class Googlon
  FOO = %w(z g v h b)
  BAR = %w(a c d e f i j k l m n o p q r s t u x y w)

  def self.foo?(letter)
    FOO.include? letter
  end

  def self.bar?(letter)
    BAR.include? letter
  end
end
