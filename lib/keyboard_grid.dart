import 'package:flutter/material.dart';
import 'package:flutter_app/keyboard_data.dart';

import 'key_button.dart';

import 'game_theme.dart';
import 'key_data.dart';

class KeyboardGrid extends StatefulWidget {
  final Function(String) callback;
  final KeyboardData data;
  final GameTheme theme;

  const KeyboardGrid(
      {required this.callback,
      required this.data,
      required this.theme,
      Key? key})
      : super(key: key);

  @override
  State<KeyboardGrid> createState() => _KeyboardGridState();
}

class _KeyboardGridState extends State<KeyboardGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', 'Å']
              .map((letter) => KeyButton(letter, widget.callback,
                  widget.data.keys[letter]!, widget.theme))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'Ö', 'Ä']
              .map((letter) => KeyButton(letter, widget.callback,
                  widget.data.keys[letter]!, widget.theme))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KeyButton('=', widget.callback, const KeyData(KeyStatus.empty),
                widget.theme,
                icon: Icons.keyboard_return),
            ...['Z', 'X', 'C', 'V', 'B', 'N', 'M']
                .map((letter) => KeyButton(letter, widget.callback,
                    widget.data.keys[letter]!, widget.theme))
                .toList(),
            KeyButton('-', widget.callback, const KeyData(KeyStatus.empty),
                widget.theme,
                icon: Icons.keyboard_backspace),
          ],
        ),
      ],
    );
  }
}
