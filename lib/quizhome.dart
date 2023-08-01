import 'package:flutter/material.dart';
import 'package:quiz_app/second_home.dart';

class QuizHome extends StatefulWidget{
  const QuizHome({Key?  key}) : super (key : key);

  @override
  State<QuizHome> createState() => RootQuizHome() ;
}

class RootQuizHome extends State<QuizHome> {
  String inputval = "" ;
  void passtoqiuz() {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
     return  SecondPage(valueinput: inputval,) ;
    }));
  }
  static const kPrimaryGradient = LinearGradient(
    colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("images/bg.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,),

          Container(
            margin: const EdgeInsets.only(top:70,left: 50),
              child:  Text("Let's Play QuiZ...",
                style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
      Center(
        child: Container(
          margin: const EdgeInsets.only(top: 70.0,right: 100.0),
          child:  Text("Enter Your Name",
              style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.grey,
              )
          ),
        ),
      ),
           Center(
          child: Container(
            margin: const EdgeInsets.only(top: 150.0,left: 30,right: 30),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: const Color(0xFF1C2341),
              borderRadius: BorderRadius.circular(8),
            ),
            child:  TextField(
              onChanged: ( value) {
                setState(() {
                  inputval = value ;
                });
              },
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                hintText: "Your Name",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.blueGrey,
                )
              ),
            ) ,
          ),
        ),
          const Spacer(),
          GestureDetector(
            onTap: passtoqiuz,
            child: Container(
              margin : const EdgeInsets.only(top: 550,left: 25,right: 25),
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 60),
              width: double.infinity,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: kPrimaryGradient,
              ),
              child: const Text("Lets Quiz Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),),
            ),
          )

      ],
      ),
    ) ;
  }
}
