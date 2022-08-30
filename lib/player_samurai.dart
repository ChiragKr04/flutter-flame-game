import 'package:flame/components.dart';
import 'package:flutterflamegame/ConstantImages/constant_images.dart';
import 'directions.dart';

class SamuraiPlayer extends SpriteComponent with HasGameRef {
  SamuraiPlayer()
      : super(
          size: Vector2.all(50.0),
        );

  PlayerDirection direction = PlayerDirection.none;
  double playerSpeed = 300;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite(ConstantImages.standing);
    position = gameRef.size / 2;
  }

  @override
  void update(double dt) {
    super.update(dt);
    movePlayer(dt);
  }

  void movePlayer(double delta) {
    switch (direction) {
      case PlayerDirection.up:
        moveUp(delta);
        break;
      case PlayerDirection.down:
        moveDown(delta);
        break;
      case PlayerDirection.left:
        moveLeft(delta);
        break;
      case PlayerDirection.right:
        moveRight(delta);
        break;
      default:
        break;
    }
  }

  void moveUp(double delta) {
    position.add(Vector2(0, -(delta * playerSpeed)));
  }

  void moveDown(double delta) {
    position.add(Vector2(0, delta * playerSpeed));
  }

  void moveRight(double delta) {
    position.add(Vector2(delta * playerSpeed, 0));
  }

  void moveLeft(double delta) {
    position.add(Vector2(-(delta * playerSpeed), 0));
  }
}
