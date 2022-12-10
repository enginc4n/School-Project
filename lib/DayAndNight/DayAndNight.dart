import 'package:flutter/material.dart';
import 'package:school_project/Colors.dart';
import 'package:school_project/MainMenu/MainMenu.dart';

class DayAndNight extends StatefulWidget {
  const DayAndNight({super.key});

  @override
  State<DayAndNight> createState() => _DayAndNightState();
}

class _DayAndNightState extends State<DayAndNight> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: AppColor.primartyColor,
      body: SafeArea(
        child: Container(
          child: RawMaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainMenu()));
              },
              child: Image.asset("images/dayandnight.png")),
        ),
      ),
    ));
  }
}
