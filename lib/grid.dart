import 'package:flutter/material.dart';

import 'letter_box.dart';

import 'grid_data.dart';

import 'game_theme.dart';

class Grid extends StatefulWidget {
  final GridData data;
  final GameTheme theme;

  const Grid({required this.data, required this.theme, Key? key})
      : super(key: key);

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  int position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List<Widget>.generate(
          6,
          (row) => Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                6,
                (col) => LetterBox(
                  data: widget.data.tiles[row][col],
                  theme: widget.theme,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
