import 'package:flutter/material.dart';
import 'package:xo_game/player_screen.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = "Start_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tic Tac Toe",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.deepPurple, // updated background color
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/xo.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.deepPurple.withOpacity(0.5),
              BlendMode.multiply,
            ),
          ),
        ),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
              elevation: 10,
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Start Game',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlayerScreen()),
              );
            },
          ),
        ),
      ),
    );
  }
}
