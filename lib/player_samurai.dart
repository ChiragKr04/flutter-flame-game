import 'package:flame/components.dart';
import 'package:flutterflamegame/ConstantImages/constant_images.dart';
import 'directions.dart';
import 'package:flame/sprite.dart';

class SamuraiPlayer extends SpriteAnimationComponent with HasGameRef {
  SamuraiPlayer()
      : super(
          size: Vector2.all(100.0),
        );

  PlayerDirection direction = PlayerDirection.none;
  double playerSpeed = 300;
  final double _animationSpeed = 0.15;
  late final SpriteAnimation _runDownAnimation;
  late final SpriteAnimation _runLeftAnimation;
  late final SpriteAnimation _runUpAnimation;
  late final SpriteAnimation _runRightAnimation;
  late final SpriteAnimation _standingAnimation;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // sprite = await gameRef.loadSprite(ConstantImages.standing);
    _loadAnimations().then((_) => {animation = _standingAnimation});
    position = gameRef.size / 2;
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load(ConstantImages.playerSpriteSheet),
      srcSize: Vector2(64.0, 64.0),
    );

    //  up animation
    _runUpAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 8);

    //  left animation
    _runLeftAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: _animationSpeed, to: 8);

    //  down animation
    _runDownAnimation =
        spriteSheet.createAnimation(row: 2, stepTime: _animationSpeed, to: 8);

    //  right animation
    _runRightAnimation =
        spriteSheet.createAnimation(row: 3, stepTime: _animationSpeed, to: 8);

    //  standing animation
    _standingAnimation =
        spriteSheet.createAnimation(row: 2, stepTime: _animationSpeed, to: 1);
  }

  @override
  void update(double dt) {
    super.update(dt);
    movePlayer(dt);
  }

  void movePlayer(double delta) {
    switch (direction) {
      case PlayerDirection.up:
        animation = _runUpAnimation;
        moveUp(delta);
        break;
      case PlayerDirection.down:
        animation = _runDownAnimation;
        moveDown(delta);
        break;
      case PlayerDirection.left:
        animation = _runLeftAnimation;
        moveLeft(delta);
        break;
      case PlayerDirection.right:
        animation = _runRightAnimation;
        moveRight(delta);
        break;
      case PlayerDirection.none:
        animation = _standingAnimation;
        idle(delta);
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

  void idle(double delta) {
    position.add(Vector2(-(delta * 0), 0));
  }
}
