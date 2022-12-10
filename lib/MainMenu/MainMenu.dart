import 'package:flutter/material.dart';
import 'package:school_project/Colors.dart';
import 'package:school_project/DayAndNight/DayAndNight.dart';
import 'package:school_project/Minesweeper/MineSweeperScreen.dart';
import 'package:school_project/Snake/Snake.dart';

class MainMenu extends StatefulWidget {
  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primartyColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Games of Games"),
          foregroundColor: AppColor.buttonColor,
          backgroundColor: AppColor.primartyColor,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //BEYKENT LOGO
                width: 200,
                height: 200,
                child: Image.asset("images/beykentlogo.png"),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SnakeGame()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColor.buttonColor,
                      borderRadius: BorderRadiusDirectional.circular(16.0)),
                  width: 200,
                  height: 100,
                  padding: EdgeInsets.fromLTRB(60, 35, 60, 35),
                  child: Text(
                    "Snake",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MineSweeperScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColor.buttonColor,
                      borderRadius: BorderRadiusDirectional.circular(16.0)),
                  width: 200,
                  height: 100,
                  padding: EdgeInsets.fromLTRB(20, 35, 20, 35),
                  child: Text(
                    "Minesweeper",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DayAndNight()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColor.buttonColor,
                      borderRadius: BorderRadiusDirectional.circular(16.0)),
                  width: 200,
                  height: 100,
                  padding: EdgeInsets.fromLTRB(20, 35, 20, 35),
                  child: Text(
                    "Day and Night",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
              )
            ],
          ),
        ));
  }
}
