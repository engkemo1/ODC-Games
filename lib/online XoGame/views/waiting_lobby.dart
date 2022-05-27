import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mp_tictactoe/provider/room_data_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_textfield.dart';


class WaitingLobby extends StatefulWidget {
  const WaitingLobby({Key? key}) : super(key: key);

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController;

  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
      text:
          Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],
    );
  }

  @override
  void dispose() {
    super.dispose();
    roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
decoration: BoxDecoration(
  image: DecorationImage(
    image: AssetImage("assets/play.jpg"),
    fit: BoxFit.fitHeight,
  ),
),
      height: MediaQuery.of(context).size.height,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text('Waiting for a player to join...',style: TextStyle(color: Colors.white,fontFamily: 'DancingScript',fontSize: 30,fontWeight: FontWeight.bold),),
          const SizedBox(height: 20),
          CustomTextField(
            controller: roomIdController,
            hintText: '',
            isReadOnly: true,
          ),
          SizedBox(height: 30,)
        ],
      )
    );
  }
}
