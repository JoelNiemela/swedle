import 'package:flutter/material.dart';
import 'package:flutter_app/game_theme.dart';

enum TileStatus {
  correct,
  present,
  wrong,
  empty,
}

class TileData {
  String letter;
  TileStatus status = TileStatus.empty;

  TileData(this.letter);

  Color statusColor(GameTheme theme) {
    switch (status) {
      case TileStatus.correct:
        return theme.correct;
      case TileStatus.present:
        return theme.present;
      case TileStatus.wrong:
        return theme.wrong;
      case TileStatus.empty:
        return theme.empty;
    }
  }

  Color textColor(GameTheme theme) {
    switch (status) {
      case TileStatus.correct:
        return theme.onCorrect;
      case TileStatus.present:
        return theme.onPresent;
      case TileStatus.wrong:
        return theme.onWrong;
      case TileStatus.empty:
        return theme.onEmpty;
    }
  }
}
