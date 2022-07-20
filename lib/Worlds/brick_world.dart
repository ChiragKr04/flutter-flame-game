import 'package:flame/components.dart';
import 'package:flutterflamegame/ConstantImages/constant_images.dart';

class BrickWorld extends SpriteComponent with HasGameRef {
  BrickWorld() : super(size: Vector2.all(100.0));

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite(ConstantImages.redBrick);
    size = sprite!.originalSize;
    return super.onLoad();
  }
}
