import 'package:flame/components.dart';
import 'package:flutterflamegame/ConstantImages/constant_images.dart';

class Samurai1Player extends SpriteComponent with HasGameRef {
  Samurai1Player() : super(size: Vector2.all(100.0));

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite(ConstantImages.samurai1);
    position = gameRef.size / 2;
    return super.onLoad();
  }
}
