import 'package:depeat_flutter_app/src/screens/main_screen.dart';
import 'package:flutter/material.dart';

class DepEat extends StatefulWidget{
  createState(){
    return DepEatState();
  }
}

class DepEatState extends State<DepEat>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}


