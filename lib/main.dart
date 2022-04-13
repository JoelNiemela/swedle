import 'package:flutter/material.dart';

import 'game_theme.dart';
import 'grid.dart';
import 'grid_data.dart';
import 'tile_data.dart';
import 'keyboard_grid.dart';
import 'keyboard_data.dart';
import 'key_data.dart';

void main() {
  runApp(MaterialApp(
    home: const Home(),
    theme: ThemeData(
      colorScheme: const ColorScheme.light(),
      fontFamily: 'Georgia',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 18, fontFamily: 'Hind'),
      ),
    ),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int rows = 6;
  int cols = 6;

  int row = 0;
  int col = 0;

  String word = 'BILVÄG';

  GridData gridData =
      GridData(List.generate(6, (_) => List.generate(6, (_) => TileData(' '))));

  KeyboardData keyboardData = KeyboardData(Map.fromIterables(
    [
      ...[for (var i = 65; i <= 90; i++) String.fromCharCode(i)],
      'Å',
      'Ä',
      'Ö'
    ],
    List.filled(29, const KeyData(KeyStatus.empty)),
  ));

  GameTheme gameTheme = GameTheme.swedle();

  void nextPos() {
    if (col < cols) {
      col++;
    }
  }

  void prevPos() {
    if (col > 0) {
      col--;
    }
  }

  void setLetter(String letter) {
    if (row < rows && col < cols) {
      gridData.tiles[row][col].letter = letter;
    }
  }

  void checkRow() {
    if (col == cols) {
      for (int i = 0; i < cols; i++) {
        if (word[i] == gridData.tiles[row][i].letter) {
          gridData.tiles[row][i].status = TileStatus.correct;
          keyboardData.keys[gridData.tiles[row][i].letter] =
              const KeyData(KeyStatus.correct);
        } else if (word.contains(gridData.tiles[row][i].letter)) {
          gridData.tiles[row][i].status = TileStatus.present;
          keyboardData.keys[gridData.tiles[row][i].letter] =
              const KeyData(KeyStatus.present);
        } else {
          gridData.tiles[row][i].status = TileStatus.wrong;
          keyboardData.keys[gridData.tiles[row][i].letter] =
              const KeyData(KeyStatus.wrong);
        }
      }

      row++;
      col = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35.0,
        title: const Text('Swedle'),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      //body: const KeyButton('a'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Grid(data: gridData, theme: gameTheme),
          ),
          const SizedBox(
            height: 10.0,
          ),
          KeyboardGrid(
            theme: gameTheme,
            data: keyboardData,
            callback: (String letter) {
              setState(() {
                if (letter == '-') {
                  prevPos();
                  setLetter(' ');
                } else if (letter == '=') {
                  checkRow();
                } else {
                  setLetter(letter);
                  nextPos();
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
