import 'package:flame/components.dart';
import 'package:flutterflamegame/ConstantImages/constant_images.dart';

class GameWorld extends SpriteComponent with HasGameRef {
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite(ConstantImages.worldGrass);
    size = Vector2(800, 600);
    return super.onLoad();
  }
}
