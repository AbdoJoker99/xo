import 'package:flutter/material.dart';
import 'package:xo_game/player_screen.dart';
import 'package:xo_game/start_screen.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: StartScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        PlayerScreen.routeName: (context) => PlayerScreen(),
        StartScreen.routeName: (context) => StartScreen(),
      },
      home: StartScreen(),
    );
  }
}
