import 'package:flutter/material.dart';
import 'package:mp_tictactoe/online%20XoGame/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;

  final String text;
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 50,width: MediaQuery.of(context).size.width-100,
      decoration: const BoxDecoration(
        color: bgColor,

        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5,
            spreadRadius: 0,
          )
        ],
      ),

        child:Center(child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        )),


      ),
    );
  }
}
