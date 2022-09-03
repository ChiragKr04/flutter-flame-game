import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterflamegame/directions.dart';
import 'main_game_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await DesktopWindow.setMaxWindowSize(
      const Size(800, 600),
    );
    await DesktopWindow.setMinWindowSize(
      const Size(800, 600),
    );
  }
  runApp(const MyGame());
}

class MyGame extends StatelessWidget {
  const MyGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Game",
      home: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (value) {
          if (value.isKeyPressed(LogicalKeyboardKey.keyW)) {
            game.onJoypadDirectionChanged(PlayerDirection.up);
          } else if (value.isKeyPressed(LogicalKeyboardKey.keyS)) {
            game.onJoypadDirectionChanged(PlayerDirection.down);
          } else if (value.isKeyPressed(LogicalKeyboardKey.keyA)) {
            game.onJoypadDirectionChanged(PlayerDirection.left);
          } else if (value.isKeyPressed(LogicalKeyboardKey.keyD)) {
            game.onJoypadDirectionChanged(PlayerDirection.right);
          } else {
            game.onJoypadDirectionChanged(PlayerDirection.none);
          }
        },
        child: const MainGamePage(),
      ),
    );
  }
}
