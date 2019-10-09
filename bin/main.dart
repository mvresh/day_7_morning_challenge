import 'dart:io';
// Last time you wrote PrintBoard function which takes in the board and prints it to the console
// Today you have to take user input and populate the Board at required location

// Challenge 1
// Take user input like A1, B3, C2 etc. and put 'X' or 'O' in required places turn by turn

//  A   B   C
// 1   |   |
//  ---+---+---
// 2   |   |
//  ---+---+---
// 3   |   |

// X's move:
// A2

//    A   B   C
//  1    |   |
//    ---+---+---
//  2  X |   |
//    ---+---+---
//  3    |   |

//  0's move:
//  B2

//  A   B   C
//  1    |   |
//    ---+---+---
//  2  X | 0 |
//    ---+---+---
//  3    |   |

//  X's move:
//  B3

//  A   B   C
//  1    |   |
//    ---+---+---
//  2  X | 0 |
//    ---+---+---
//  3    | X |

//  0's move:
//  A2

//  A   B   C
// 1    |   |
//   ---+---+---
// 2  0 | 0 |
//   ---+---+---
// 3    | X |

//  X's move:
//  B2

//    A   B   C
//  1    |   |
//    ---+---+---
//  2  0 | X |
//    ---+---+---
//  3    | X |
//  0's move:

// HINT: to get string character you can use [], example String name ='Arnav'; name[0] gives 'A'


// Challenge 2
// Validate the move
// In case if there is already an entry on board print invalid move
int row;
int column;
main() {
  var boardSize = 3;
  int i = 0;
  String input;
  List<List<String>> board =
  List.generate(boardSize, (_) => List.filled(boardSize, ' '));
  while(i >= 0){
      if(i % 2 == 0){
        print('X move');
        input = stdin.readLineSync();
        if (board[getRowAndColumn(input)[0]-1][getRowAndColumn(input)[1]-1] == ' '){
          board[getRowAndColumn(input)[0]-1][getRowAndColumn(input)[1]-1] = 'X';
        }
        else{
          print('invalid move');
        }
      }
      else{
        print('O move');
        input = stdin.readLineSync();
        if(board[getRowAndColumn(input)[0]-1][getRowAndColumn(input)[1]-1] == ' '){
          board[getRowAndColumn(input)[0]-1][getRowAndColumn(input)[1]-1] = 'O';
        }
        else{
          print('invalid move');
        }
      }
      printBoard(board);
      i++;
  }



}

List<int> getRowAndColumn(String entry){
  row = int.parse(entry[1]);

  switch (entry[0]) {
    case 'A':
      {
        column = 1;
      }
      break;

    case 'B':
      {
        column = 2;
      }
      break;

    case 'C':
      {
        column = 3;
      }
      break;
  }

  return [row, column];

}

void printBoard(List<List<String>> board) {
  print('   A   B   C ');
  List<String> rows = board.map(rowToString).toList();
  print('1 ${rows[0]}');
  print('  ---+---+---');
  print('2 ${rows[1]}');
  print('  ---+---+---');
  print('3 ${rows[2]}');
}

String rowToString(List<String> row) {
  return row.map((String val) => ' $val ').join('|');
}