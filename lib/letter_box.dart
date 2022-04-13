import 'package:flutter/material.dart';

import 'tile_data.dart';

import 'game_theme.dart';

class LetterBox extends StatefulWidget {
  final TileData data;
  final GameTheme theme;

  const LetterBox({required this.data, required this.theme, Key? key})
      : super(key: key);

  @override
  State<LetterBox> createState() => _LetterBoxState();
}

class _LetterBoxState extends State<LetterBox> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]!, width: 1.4),
          color: widget.data.statusColor(widget.theme),
        ),
        child: TextButton(
          onPressed: () {
            setState(() {});
          },
          child: Text(
            widget.data.letter,
            style: TextStyle(
              color: widget.data.textColor(widget.theme),
            ),
          ),
        ),
      ),
    );
  }
}
