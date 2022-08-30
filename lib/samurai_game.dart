import 'package:flame/game.dart';
import 'package:flutterflamegame/directions.dart';
import 'package:flutterflamegame/player_samurai.dart';

class SamuraiGame extends FlameGame {
  SamuraiPlayer player = SamuraiPlayer();
  void onJoypadDirectionChanged(PlayerDirection direction) {
    player.direction = direction;
  }

  @override
  Future<void> onLoad() async {
    add(player);
  }
}
