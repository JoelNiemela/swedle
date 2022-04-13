import 'package:flutter/material.dart';
import 'package:flutter_app/game_theme.dart';

enum KeyStatus {
  correct,
  present,
  wrong,
  empty,
}

class KeyData {
  final KeyStatus status;

  const KeyData(this.status);

  Color statusColor(GameTheme theme) {
    switch (status) {
      case KeyStatus.correct:
        return theme.correct;
      case KeyStatus.present:
        return theme.present;
      case KeyStatus.wrong:
        return theme.wrong;
      case KeyStatus.empty:
        return theme.empty;
    }
  }

  Color textColor(GameTheme theme) {
    switch (status) {
      case KeyStatus.correct:
        return theme.onCorrect;
      case KeyStatus.present:
        return theme.onPresent;
      case KeyStatus.wrong:
        return theme.onWrong;
      case KeyStatus.empty:
        return theme.onEmpty;
    }
  }
}
