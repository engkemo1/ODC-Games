import 'package:flutter/material.dart';
import 'package:mp_tictactoe/Splash%20Screen.dart';
import 'package:mp_tictactoe/provider/room_data_provider.dart';
import 'package:provider/provider.dart';

import 'online XoGame/screens/create_room_screen.dart';
import 'online XoGame/screens/game_screen.dart';
import 'online XoGame/screens/join_room_screen.dart';
import 'online XoGame/screens/main_menu_screen.dart';
import 'online XoGame/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
        ),
        routes: {
          MainMenuScreen.routeName: (context) => const MainMenuScreen(),
          JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
          GameScreen.routeName: (context) => const GameScreen(),
          SplashScreen.routeName:(context)=> SplashScreen()
        },
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
