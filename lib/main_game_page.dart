import 'dart:io';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutterflamegame/directions.dart';
import 'package:flutterflamegame/samurai_game.dart';

import 'joy_pad.dart';

SamuraiGame game = SamuraiGame();

class MainGamePage extends StatefulWidget {
  const MainGamePage({Key? key}) : super(key: key);

  @override
  State<MainGamePage> createState() => _MainGamePageState();
}

class _MainGamePageState extends State<MainGamePage> {
  void onJoypadChangeDirection(PlayerDirection direction) {
    game.onJoypadDirectionChanged(direction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            GameWidget(
              game: game,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Platform.isWindows
                  ? const Offstage()
                  : Joypad(
                      onDirectionChanged: onJoypadChangeDirection,
                    ),
            )
          ],
        );
      }),
    );
  }
}
