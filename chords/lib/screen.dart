import 'package:chords/welcome_screen.dart';
import 'package:chords/game_screen.dart';
import 'package:flutter/material.dart';

enum Screen { Welcome, Game }

extension Routes on Screen {
  String get id => const {
        Screen.Welcome: 'welcome_screen',
        Screen.Game: 'game_screen',
      }[this];
  Widget get instance => {
        Screen.Welcome: WelcomeScreen(),
        Screen.Game: GameScreen(),
      }[this];
}
