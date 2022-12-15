import 'dart:developer';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:school_project/colors.dart';
import 'package:school_project/Minesweeper/MineSweeperGame.dart';

class MineSweeperScreen extends StatefulWidget {
  @override
  _MineSweeperScreenState createState() => _MineSweeperScreenState();
}

class _MineSweeperScreenState extends State<MineSweeperScreen> {
  MineSweeperGame game = MineSweeperGame();

  @override
  void endGame() {
    game.gameOver = true;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Game Over'),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void initState() {
    super.initState();
    game.GenerateMap();
  }

  int timeLeft = 60;
  void StartTimer() {
    Timer.periodic(Duration(seconds: timeLeft), (timer) {
      timeLeft = timeLeft - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primartyColor,
      appBar: AppBar(
        backgroundColor: AppColor.primartyColor,
        centerTitle: true,
        title: Text("MineSweeper"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.0, vertical: 16.0),
                  decoration: BoxDecoration(
                      color: AppColor.lightPrimary,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          // BOMBS ICON HERE
                          Icons.timer,
                          color: AppColor.accentColor,
                          size: 34,
                        ),
                        Text(
                          setState(() {
                            
                          },
                          timeLeft.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold),
                        )
                        
                      ],
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.0, vertical: 16.0),
                  decoration: BoxDecoration(
                      color: AppColor.lightPrimary,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        // BOMBS ICON HERE
                        Icons.flag,
                        color: AppColor.accentColor,
                        size: 34,
                      ),
                      Text(
                        game.mines.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ))
              ],
            ),
            Container(
              width: double.infinity,
              //PLAY BUTTON
              height: 400.0,
              padding: EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MineSweeperGame.row,
                    crossAxisSpacing: 4.0,
                    mainAxisExtent: 60.0,
                  ),
                  itemCount: MineSweeperGame.cells,
                  itemBuilder: (BuildContext ctx, index) {
                    Color cellColor = game.gameMap[index].reveal
                        ? AppColor.clickedCard
                        : AppColor.lightPrimary;
                    return GestureDetector(
                      onTap: game.gameOver
                          ? null
                          : () {
                              setState(() {
                                game.GetClicked(game.gameMap[index]);
                              });
                            },
                      child: Container(
                        decoration: BoxDecoration(
                            color: cellColor,
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Center(
                          child: Text(
                            game.gameMap[index].reveal
                                ? "${game.gameMap[index].content}"
                                : "",
                            style: TextStyle(
                              color: game.gameMap[index].reveal
                                  ? game.gameMap[index].content == "X"
                                      ? Colors.red
                                      : Colors.red[game.gameMap[index].content]
                                  : Colors.transparent,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Text(
              game.gameOver ? "You Lost" : "",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            RawMaterialButton(
              onPressed: () {
                setState(() {
                  timeLeft = 60;
                  StartTimer();
                  game.ResetGame();
                  game.gameOver = false;
                });
              },
              fillColor: AppColor.lightPrimary,
              elevation: 0,
              shape: StadiumBorder(),
              padding: EdgeInsets.symmetric(horizontal: 64.0, vertical: 18.0),
              child: Text(
                "Retry",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
