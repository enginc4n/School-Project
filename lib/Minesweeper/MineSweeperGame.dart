import 'dart:math';
import 'package:school_project/Minesweeper/MineSweeperScreen.dart';

class MineSweeperGame {
  static int row = 8;
  static int column = 6;
  static int cells = row * column;
  int mines = 7;
  bool gameOver = false;
  List<Cell> gameMap = [];
  static List<List<dynamic>> map = List.generate(
      row, (x) => List.generate(column, (y) => Cell(x, y, "", false)));

  void GenerateMap() {
    PlaceMines(mines);
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < column; j++) {
        gameMap.add(map[i][j]);
      }
    }
  }

  void PlaceMines(int mineNumber) {
    Random random = Random();
    for (int i = 0; i < mineNumber; i++) {
      int mineRow = random.nextInt(row);
      int mineColumn = random.nextInt(column);
      map[mineRow][mineColumn] = Cell(mineRow, mineColumn, "X", false);
    }
  }

  void ResetGame() {
    map = List.generate(
        row, (x) => List.generate(column, (y) => Cell(x, y, "", false)));
    gameMap.clear();
    GenerateMap();
  }

  void ShowMines() {
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < column; j++) {
        if (map[i][j].content == "X") {
          map[i][j].reveal = true;
        }
      }
    }
  }

  void GetClicked(Cell cell) {
    if (cell.content == "X") {
      ShowMines();
      gameOver = true;
    } else {
      int mineCount = 0;
      int cellRow = cell.row;
      int cellCol = cell.column;

      for (int i = max(cellRow - 1, 0); i <= min(cellRow + 1, row - 1); i++) {
        for (int j = max(cellCol - 1, 0);
            j <= min(cellCol + 1, column - 1);
            j++) {
          if (map[i][j].content == "X") {
            mineCount++;
          }
        }
      }
      cell.content = mineCount;
      cell.reveal = true;
      if (mineCount == 0) {
        for (int i = max(cellRow - 1, 0); i <= min(cellRow + 1, row - 1); i++) {
          for (int j = max(cellCol - 1, 0);
              j <= min(cellCol + 1, column - 1);
              j++) {
            if (map[i][j].content == "") {
              GetClicked(map[i][j]);
            }
          }
        }
      }
    }
  }
} //class ends

class Cell {
  int row;
  int column;
  dynamic content;
  bool reveal = false;
  Cell(this.row, this.column, this.content, this.reveal);
}
