import 'package:flutter/material.dart';
 class Score extends StatelessWidget {
   const Score({Key? key}) : super(key : key);

   @override
   Widget build(BuildContext context) {
     return const Scaffold(
       body: Text("Score : 1/10",
         style: TextStyle(
           color: Colors.black,
           fontSize: 18,
         ),),
     );
   }
 }