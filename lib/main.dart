import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutterflamegame/PlayerAnim/samurai1_player.dart';
import 'package:flutterflamegame/Worlds/brick_world.dart';

void main() {
  final game = SamuraiGame();
  runApp(
    GameWidget(
      game: game,
    ),
  );
}

class SamuraiGame extends FlameGame {
  Samurai1Player samuraiPlayer = Samurai1Player();
  BrickWorld brickWorld = BrickWorld();
  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(brickWorld);
    await add(samuraiPlayer);
    samuraiPlayer.position = brickWorld.size / 1.5;
    camera.followComponent(
      samuraiPlayer,
      worldBounds: Rect.fromLTRB(
        0,
        0,
        brickWorld.size.x,
        brickWorld.size.y,
      ),
    );
  }
}
