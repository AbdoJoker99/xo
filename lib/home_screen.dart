import 'package:flutter/material.dart';

import 'boarder_button.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "xo_game";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> boardState = ["", "", "", "", "", "", "", "", ""];
  int player1 = 0;
  int player2 = 0;
  @override
  Widget build(BuildContext context) {
    XoGameArgs args = ModalRoute.of(context)?.settings.arguments as XoGameArgs;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "X-O",
          style: TextStyle(
              color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.player1xo}(X)",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${player1}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.player2xo}(O)",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${player2}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoarderButton(
                  text: boardState[0],
                  index: 0,
                  onButtonClick: onButtonClicked,
                ),
                BoarderButton(
                  text: boardState[1],
                  index: 1,
                  onButtonClick: onButtonClicked,
                ),
                BoarderButton(
                  text: boardState[2],
                  index: 2,
                  onButtonClick: onButtonClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoarderButton(
                  text: boardState[3],
                  index: 3,
                  onButtonClick: onButtonClicked,
                ),
                BoarderButton(
                  text: boardState[4],
                  index: 4,
                  onButtonClick: onButtonClicked,
                ),
                BoarderButton(
                  text: boardState[5],
                  index: 5,
                  onButtonClick: onButtonClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoarderButton(
                    text: boardState[6],
                    index: 6,
                    onButtonClick: onButtonClicked),
                BoarderButton(
                    text: boardState[7],
                    index: 7,
                    onButtonClick: onButtonClicked),
                BoarderButton(
                    text: boardState[8],
                    index: 8,
                    onButtonClick: onButtonClicked),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onButtonClicked(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      boardState[index] = "X";
    } else {
      boardState[index] = "O";
    }
    counter++;
    setState(() {});
    if (checkWinner("X")) {
      player1 += 5;
      intiBoard();
    } else if (checkWinner("O")) {
      player2 += 5;
      intiBoard();
    } else if (counter == 9) {
      intiBoard();
    }
  }

  bool checkWinner(String symbol) {
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    return false; // add this line to return false if no winner is found
  }

  void intiBoard() {
    boardState = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
    setState(() {});
  }
}

class XoGameArgs {
  String player1xo;
  String player2xo;
  XoGameArgs({required this.player1xo, required this.player2xo});
}
