
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mp_tictactoe/online%20XoGame/screens/main_menu_screen.dart';
import 'package:mp_tictactoe/online%20XoGame/utils/colors.dart';

import 'offline XoGame/Xogame.dart';
class MultiPlayerScreen extends StatelessWidget {
  const MultiPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 1,child: Container(
            child: Center(
              child: Text(
              "Lets Play",
              style:  TextStyle(
                  color: Colors.white,
                  fontSize: 65,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                  fontFamily: 'DancingScript'),
            ),
            ),
          ),),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>MainMenuScreen()));

                },
                child: Container(

                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20) ,image: DecorationImage(
                  image: AssetImage("assets/vs.jpg"),
                  fit: BoxFit.cover,
                ),),
                ),
              )),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>GamePage(hi: 1,)));


                },
                child: Container(
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20) ,image: DecorationImage(
                    image: AssetImage("assets/offline.jpg"),
                    fit: BoxFit.cover,
                  ),),


                  ),
                ),
              )
        ],
      ),
    );
  }
}
