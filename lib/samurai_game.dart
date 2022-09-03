import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutterflamegame/directions.dart';
import 'package:flutterflamegame/game_world.dart';
import 'package:flutterflamegame/player_samurai.dart';
import 'dart:ui';

class SamuraiGame extends FlameGame {
  SamuraiPlayer player = SamuraiPlayer();
  GameWorld world = GameWorld();
  void onJoypadDirectionChanged(PlayerDirection direction) {
    player.direction = direction;
  }

  @override
  Future<void> onLoad() async {
    add(world);
    add(player);
    player.position = world.size / 2;
    camera.followComponent(
      player,
      worldBounds: const Rect.fromLTRB(0, 0, 800, 600),
    );
  }
}
