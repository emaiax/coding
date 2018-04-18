# OBI 2015 - Lápis de Cor
#
# Roberto tem um conjunto de lápis com 10 tons diferentes de uma mesma cor, numerados de 0 a 9.
# Numa folha de caderno quadriculado alguns quadrados foram coloridos inicialmente com o tom 0.
# Roberto precisa determinar, para cada quadrado Q não colorido, qual é a distância dele para o
# quadrado mais próximo de tom 0. A distância entre dois quadrados é definida com o número mínimo
# de movimentos ortogonais (para: esquerda, direita, cima, baixo) para ir de um quadrado para o outro.
# O quadrado Q, então, deve ser colorido com o tom cuja numeração corresponde à distância determinada.
# Se a distância for maior ou igual a 9, o quadrado deve ser colorido com o tom 9. Seu programa deve
# colorir e imprimir a folha quadriculada dada na entrada. 
#
# Entrada
#
# A primeira linha da entrada contém apenas um inteiro N, determinando as dimensões da folha quadriculada, N × N.
# As N linhas seguintes definem a folha inicialmente. Cada linha contém uma sequência de N caracteres: ‘*’ se o
# quadrado não está colorido, e ‘0’ se está colorido com o tom 0. 
#
# Saída
#
# Seu programa deve imprimir o tabuleiro totalmente colorido, de acordo com a regra definida acima.
#
# Restrições
# - 3 ≤ N ≤ 1000.
#
# Informações sobre a pontuação:
# - Em um conjunto de casos de teste somando 40 pontos, N ≤ 100 
#
# Entrada   Saída
# 3         432
# ***       321
# ***       210
# **0
#
require_relative "../spec_helper.rb"
require_relative "uri_gets_counter_helper"

def distance_to_nearest_zero(point, zeroes)
  maximum_distance = 9

  zeroes.each do |zero_point|
    distance_from_point = (zero_point[:x] - point[:x]).abs + (zero_point[:y] - point[:y]).abs

    maximum_distance = distance_from_point if distance_from_point < maximum_distance
  end

  maximum_distance
end

def solution
  matrix = []

  matrix_size = gets.to_i

  0.upto(matrix_size - 1) do |row_index|
    gets.split(//).each.with_index do |color, column_index|
      matrix << { color: color, x: row_index, y: column_index }
    end
  end

  zeroes = matrix.select { |point| point[:color] == "0" }

  matrix.each do |point|
    point[:color] = distance_to_nearest_zero(point, zeroes)
  end

  puts matrix.map { |point| point[:color] }.each_slice(matrix_size).map(&:join).join("\n")
end

RSpec.describe "1024" do
  context "3x3 matrix" do
    let(:input_sample)  { ["3", "***", "***", "**0"] }
    let(:output_sample) { "432\n321\n210\n" }

    it { expect { solution }.to output(output_sample).to_stdout }
  end

  context "8x8 matrix" do
    let(:input_sample)  { ["8", "**000***", "********", "*****0**", "********", "*****000", "*******0", "0******0", "********"] }
    let(:output_sample) { "21000123\n32111123\n43221012\n34332111\n23321000\n12332110\n01233210\n12344321\n" }

    it { expect { solution }.to output(output_sample).to_stdout }
  end

  context "12x12 matrix" do
    let(:input_sample)  { ["12", "************", "************", "************", "************", "************", "************", "************", "************", "************", "************", "************", "***********0"] }
    let(:output_sample) { "999999999999\n999999999999\n999999999999\n999999999998\n999999999987\n999999999876\n999999998765\n999999987654\n999999876543\n999998765432\n999987654321\n999876543210\n" }

    it { expect { solution }.to output(output_sample).to_stdout }
  end
end
