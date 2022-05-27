import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mp_tictactoe/provider/room_data_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/o.dart';
import '../../widgets/x.dart';
import '../resources/socket_methods.dart';
import '../utils/colors.dart';
import '../views/tictactoe_board.dart';
import '../views/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();
  late  ConfettiController _centerController;




  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
    _centerController =
        ConfettiController(duration: const Duration(seconds: 10));

  }
  @override
  void dispose() {
    _centerController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    return Scaffold(

      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: _centerController,
                blastDirection: pi / 2,
                maxBlastForce: 10,
                minBlastForce: 2,

                emissionFrequency: 0.03,
                numberOfParticles: 10,

                // particles will pop-up up
                gravity: 0,
              ),
            ),

            Container(
              color:bgColor,
              height: 40,
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {

                    },
                    color: Colors.white,
                    iconSize: 30,
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Center(
                        child: Text(
                          roomDataProvider.player1.points.toInt().toString(),
                          style: const TextStyle(color: Colors.black, fontSize: 18),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                X(35, 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child:  Text(
                    'Player',
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width*0.1,),

            const TicTacToeBoard(),
            SizedBox(height: 20,),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: bgColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  O(35, Colors.green),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(

                      'Player',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Center(
                          child: Text(
                            roomDataProvider.player2.points.toInt().toString() ,
                            style: const TextStyle(color: Colors.black, fontSize: 18),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),

            Text(

              '${roomDataProvider.roomData['turn']['nickname']}\'s turn',
              style: TextStyle(fontSize: 20),textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
