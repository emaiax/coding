=begin
Um vulcão acaba de entrar em erupção, provocando uma nuvem de cinzas que se alastra impedindo a circulação aérea.
O governo está muito preocupado e deseja saber quando que a nuvem de cinzas irá atingir todos os aeroportos do país.

Está disponível um mapa detalhando a situação atual. O mapa é retangular, dividido em pequenos quadrados.
Neste mapa existem três tipos de quadrados: nuvem (indicando que esta região do mapa já está coberto por nuvens),
aeroportos (indicando a localização de um aeroporto) e todas as outras (indicando locais onde a nuvem ainda não chegou).

A cada dia, a nuvem expande-se um quadrado na horizontal e um quadrado na vertical. Ou seja, ao fim de cada dia,
todos os quadrados adjacentes (vertical ou horizontalmente) a uma nuvem, também passam a conter nuvens.
Por exemplo:

. . * . . . * *      . * * * . * * *     * * * * * * * *
. * * . . . . .      * * * * . . * *     * * * * * * * *
* * * . A . . A      * * * * A . . A     * * * * * . * *
. * . . . . . .  ->  * * * . . . . .  -> * * * * . . . .
. * . . . . A .      * * * . . . A .     * * * * . . A .
. . . A . . . .      . * . A . . . .     * * * A . . . .
. . . . . . . .      . . . . . . . .     . * . . . . . .
     Dia 1                Dia 2               Dia 3

Para preparar os planos de contingência, o governo necessita saber: quantos dias demorará para ao menos um
aeroporto ficar coberto pelas nuvens e daqui quantos dias todos os aeroportos estarão cobertos pelas nuvens.

Dados um quadriculado com L linhas e C colunas, além da indicação inicial das nuvens e dos aeroportos,
desenvolva uma programa que informe o número de dias até um primeiro aeroporto ficar debaixo da nuvem de
cinzas e o número de dias até que todos os aeroportos ficarem cobertos pelas cinzas.

Fonte: http://www.dcc.fc.up.pt/oni/problemas/2010/qualificacao/probB.html
=end

require_relative "../spec_helper"

class City
  attr_reader :days, :blocks, :airports

  def initialize(width, height)
    @days = 0
    @width = width
    @height = height
    @airports = 0

    @blocks = Array.new(width) { Array.new(height) }
  end

  def next_day
    @days += 1

    (0...@width).each do |x|
      (0...@height).each do |y|
        if @blocks[x][y] == "C"
          add(x + 1, y, "C")
          add(x - 1, y, "C")
          add(x, y + 1, "C")
          add(x, y - 1, "C")
        end
      end
    end
  end

  def add(x, y, kind)
    return if x >= @width or y >= @height

    @airports += 1 if kind == "A"
    @airports -= 1 if kind == "C" and @blocks[x][y] == "A"

    @blocks[x][y] = kind
  rescue => e
    binding.pry
  end

  def end_game
    next_day while airports > 0
    @days
  end
end

RSpec.describe "NuvemDeCinzas" do
  describe "example" do
    before do
      subject.add(2, 4, "A")
      subject.add(2, 7, "A")
      subject.add(4, 6, "A")
      subject.add(5, 3, "A")

      subject.add(0, 2, "C")
      subject.add(0, 6, "C")
      subject.add(0, 7, "C")
      subject.add(1, 1, "C")
      subject.add(1, 2, "C")
      subject.add(2, 0, "C")
      subject.add(2, 1, "C")
      subject.add(2, 2, "C")
      subject.add(3, 1, "C")
      subject.add(4, 1, "C")
    end

    subject { City.new(8, 7) }

    it { expect(subject.end_game).to eql(5) }
  end

  describe "no airports" do
    subject { City.new(8, 7) }

    it { expect(subject.end_game).to eql(0) }
  end
end
