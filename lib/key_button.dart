import 'package:flutter/material.dart';

import 'key_data.dart';
import 'game_theme.dart';

class KeyButton extends StatefulWidget {
  final String letter;
  final Function(String) callback;
  final IconData? icon;
  final KeyData data;
  final GameTheme theme;

  const KeyButton(
    this.letter,
    this.callback,
    this.data,
    this.theme, {
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  State<KeyButton> createState() => _KeyButtonState();
}

class _KeyButtonState extends State<KeyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: widget.data.statusColor(widget.theme),
      ),
      child: TextButton(
        onPressed: () {
          widget.callback(widget.letter);
        },
        child: Container(
          alignment: Alignment.center,
          child: widget.icon != null
              ? Icon(
                  widget.icon,
                  color: widget.data.textColor(widget.theme),
                )
              : Text(
                  widget.letter,
                  style: TextStyle(
                    color: widget.data.textColor(widget.theme),
                  ),
                ),
        ),
      ),
    );
  }
}
