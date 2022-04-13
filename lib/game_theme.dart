import 'package:flutter/material.dart';

class GameTheme {
  final Color correct;
  final Color present;
  final Color wrong;
  final Color empty;
  final Color passive;

  final Color onCorrect;
  final Color onPresent;
  final Color onWrong;
  final Color onEmpty;
  final Color onPassive;

  GameTheme({
    // bg
    required this.correct,
    required this.present,
    required this.wrong,
    required this.empty,
    required this.passive,

    // fg
    required this.onCorrect,
    required this.onPresent,
    required this.onWrong,
    required this.onEmpty,
    required this.onPassive,
  });

  static GameTheme light() {
    return GameTheme(
      // bg
      correct: Colors.green,
      present: Colors.amber,
      wrong: Colors.grey[600]!,
      empty: Colors.transparent,
      passive: Colors.grey[400]!,

      // fg
      onCorrect: Colors.black,
      onPresent: Colors.black,
      onWrong: Colors.white,
      onEmpty: Colors.black,
      onPassive: Colors.white,
    );
  }

  static GameTheme swedle() {
    return GameTheme(
      // bg
      correct: Colors.blue[400]!,
      present: Colors.yellow[600]!,
      wrong: Colors.grey[600]!,
      empty: Colors.transparent,
      passive: Colors.grey[400]!,

      // fg
      onCorrect: Colors.white,
      onPresent: Colors.black,
      onWrong: Colors.white,
      onEmpty: Colors.black,
      onPassive: Colors.white,
    );
  }
}
