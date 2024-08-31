import 'package:flutter/material.dart';

import 'home_screen.dart';

class PlayerScreen extends StatelessWidget {
  static const String routeName = "player_screen";
  String player1name = "";
  String player2name = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Player_Screen",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: "player(X) name",
                  labelStyle: TextStyle(fontSize: 18, color: Colors.lightBlue)),
              onChanged: (text) {
                player1name = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "player(O) name",
                  labelStyle: TextStyle(fontSize: 18, color: Colors.lightBlue)),
              onChanged: (text) {
                player2name = text;
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  //  Navigator.push(
                  //  context,
                  //MaterialPageRoute(builder: (context) => HomeScreen()),
                  Navigator.of(context).pushNamed(HomeScreen.routeName,
                      arguments: XoGameArgs(
                          player1xo: player1name, player2xo: player2name));
                },
                child: Text(
                  "lest play",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
