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

Point = Struct.new(:x, :y, :what)

class Board
  attr_reader :days

  def initialize(width, height, airports, clouds)
    @days = 0
    @width = width
    @height = height
    @clouds = clouds
    @airports = airports
  end

  def next_day
    @day += 1

    # . . * . . . * *      . * * * . * * *     * * * * * * * *
    # . * * . . . . .      * * * * . . * *     * * * * * * * *
    # * * * . A . . A      * * * * A . . A     * * * * * . * *
    # . * . . . . . .  ->  * * * . . . . .  -> * * * * . . . .
    # . * . . . . A .      * * * . . . A .     * * * * . . A .
    # . . . A . . . .      . * . A . . . .     * * * A . . . .
    # . . . . . . . .      . . . . . . . .     . * . . . . . .
    #      Dia 1                Dia 2               Dia 3
    #
    clouds.each do |cloud|
      unless clouds.detect { |c| c.x cloud.x + 1 && cloud.y + 1 }
        clouds << Point.new(cloud.x + 1, cloud.y + 1)
      end

      unless clouds.detect { |c| c.x cloud.x - 1 && cloud.y - 1 }
        clouds << Point.new(cloud.x - 1, cloud.y - 1)
      end
    end while airports.count > 0
  end

  def end_game
    next_day while airports.count > 0
  end
end

RSpec.describe "NuvemDeCinzas" do
  describe "example" do
    let(:airports) do
      [
        Point.new(5, 3),
        Point.new(8, 3),
        Point.new(7, 5),
        Point.new(4, 6)
      ]
    end

    let(:clouds) do
      [
        Point.new(3, 1),
        Point.new(7, 1),
        Point.new(8, 1),
        Point.new(2, 2),
        Point.new(3, 2),
        Point.new(1, 3),
        Point.new(2, 3),
        Point.new(3, 3),
        Point.new(2, 4),
        Point.new(2, 5)
      ]
    end

    subject { Board.new(8, 7, airports, clouds) }

    it { expect(subject.end_game).to eql(4) }
  end

  describe "no airports" do
    let(:clouds) { [ ] }
    let(:airports) { [ ] }

    subject { Board.new(8, 7, airports, clouds) }

    it { expect(subject.end_game).to eql(0) }
  end
end
