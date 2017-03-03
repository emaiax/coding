/*
URI Online Judge | 1021
Banknotes and Coins
By Neilor Tonin, URI  Brazil
Timelimit: 1

Read a value of floating point with two decimal places. This represents a monetary value. After this, calculate the smallest possible
number of notes and coins on which the value can be decomposed. The considered notes are of 100, 50, 20, 10, 5, 2.
The possible coins are of 1, 0.50, 0.25, 0.10, 0.05 and 0.01. Print the message “NOTAS:” followed by the list of notes and the
message “MOEDAS:” followed by the list of coins.

Input

The input file contains a value of floating point N (0 ≤ N ≤ 1000000.00).

Output

Print the minimum quantity of banknotes and coins necessary to change the initial value, as the given example.

Input Sample	  Output Sample
576.73          NOTAS:
                5 nota(s) de R$ 100.00
                1 nota(s) de R$ 50.00
                1 nota(s) de R$ 20.00
                0 nota(s) de R$ 10.00
                1 nota(s) de R$ 5.00
                0 nota(s) de R$ 2.00
                MOEDAS:
                1 moeda(s) de R$ 1.00
                1 moeda(s) de R$ 0.50
                0 moeda(s) de R$ 0.25
                2 moeda(s) de R$ 0.10
                0 moeda(s) de R$ 0.05
                3 moeda(s) de R$ 0.01

4.00            NOTAS:
                0 nota(s) de R$ 100.00
                0 nota(s) de R$ 50.00
                0 nota(s) de R$ 20.00
                0 nota(s) de R$ 10.00
                0 nota(s) de R$ 5.00
                2 nota(s) de R$ 2.00
                MOEDAS:
                0 moeda(s) de R$ 1.00
                0 moeda(s) de R$ 0.50
                0 moeda(s) de R$ 0.25
                0 moeda(s) de R$ 0.10
                0 moeda(s) de R$ 0.05
                0 moeda(s) de R$ 0.01

91.01           NOTAS:
                0 nota(s) de R$ 100.00
                1 nota(s) de R$ 50.00
                2 nota(s) de R$ 20.00
                0 nota(s) de R$ 10.00
                0 nota(s) de R$ 5.00
                0 nota(s) de R$ 2.00
                MOEDAS:
                1 moeda(s) de R$ 1.00
                0 moeda(s) de R$ 0.50
                0 moeda(s) de R$ 0.25
                0 moeda(s) de R$ 0.10
                0 moeda(s) de R$ 0.05
                1 moeda(s) de R$ 0.01
*/

#include <stdio.h>

int main() {
  double value;
  scanf("%lf", &value);

  int notas_100 = 0,  notas_50 = 0,  notas_20 = 0,  notas_10 = 0,  notas_5 = 0,  notas_2 = 0;
  int moedas_100 = 0, moedas_50 = 0, moedas_25 = 0, moedas_10 = 0, moedas_5 = 0, moedas_1 = 0;

  notas_100 = value / 100;
  value -= notas_100 * 100;

  notas_50 = value / 50;
  value -= notas_50 * 50;

  notas_20 = value / 20;
  value -= notas_20 * 20;

  notas_10 = value / 10;
  value -= notas_10 * 10;

  notas_5 = value / 5;
  value -= notas_5 * 5;

  notas_2 = value / 2;
  value -= notas_2 * 2;

  printf("NOTAS:\n");
  printf("%d nota(s) de R$ 100.00\n", notas_100);
  printf("%d nota(s) de R$ 50.00\n", notas_50);
  printf("%d nota(s) de R$ 20.00\n", notas_20);
  printf("%d nota(s) de R$ 10.00\n", notas_10);
  printf("%d nota(s) de R$ 5.00\n", notas_5);
  printf("%d nota(s) de R$ 2.00\n", notas_2);

  // o máximo que pode sobrar até aqui é 1.99, então convertemos em centenas pra facilitar os cálculos das moedas
  //
  value *= 100;

  moedas_100 = value / 100;
  value -= moedas_100 * 100;

  moedas_50 = value / 50;
  value -= moedas_50 * 50;

  moedas_25 = value / 25;
  value -= moedas_25 * 25;

  moedas_10 = value / 10;
  value -= moedas_10 * 10;

  moedas_5 = value / 5;
  value -= moedas_5 * 5;

  moedas_1 = value / 1;
  value -= moedas_1 * 1;

  printf("MOEDAS:\n");
  printf("%d moeda(s) de R$ 1.00\n", moedas_100);
  printf("%d moeda(s) de R$ 0.50\n", moedas_50);
  printf("%d moeda(s) de R$ 0.25\n", moedas_25);
  printf("%d moeda(s) de R$ 0.10\n", moedas_10);
  printf("%d moeda(s) de R$ 0.05\n", moedas_5);
  printf("%d moeda(s) de R$ 0.01\n", moedas_1);

  return 0;
}
