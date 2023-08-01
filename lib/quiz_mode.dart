import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_app/question_time_out.dart';
import 'package:quiz_app/questions.dart';

class QuizModel extends StatefulWidget {
  final Question question1;
  final int correctAnswer ;

  const QuizModel({Key? key, required this.question1, required this.correctAnswer}) : super(key: key);

  @override
  _QuizModelState createState() => _QuizModelState();
}

class _QuizModelState extends State<QuizModel> {

  final QuestionController _questionController = Get.put(QuestionController());

  bool isSelected = false;


  getColor(int answer) {
    if (isSelected == true) {
      if (answer == widget.correctAnswer) {
        _questionController.numberCorrectAnswers++;
        return Colors.green ;
      }else{
        return Colors.red ;
      }
    } else {
      return Colors.black;
    }
  }

  void onInit() {
    _questionController.value = widget.question1.id ;
  }


  @override
  Widget build(BuildContext context) {
    _questionController.rr() ;
    Size screenWidth = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 250, left: screenWidth.width * 0.05,right: screenWidth.height*0.05),
      padding: const EdgeInsets.all(10),
      width: screenWidth.width * 0.5,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30, top: 20, bottom: 30),
            child: Text(
              widget.question1.question,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          StatefulBuilder(
            builder: (context, setState) => GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 90),
                margin: const EdgeInsets.only(top: 5, bottom: 30),
                decoration: BoxDecoration(
                  border: Border.all(color: getColor(1), width: 3),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  widget.question1.options[0],
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          StatefulBuilder(builder: (context, setState) => GestureDetector(
            onTap: () {
              setState(() {
                isSelected = true;
              });
            },
            child:Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 90),
              margin: const EdgeInsets.only(top: 5, bottom: 30),
              decoration: BoxDecoration(
                border: Border.all(color: getColor(2), width: 3),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                widget.question1.options[1],
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            ) ,
          )),
          StatefulBuilder(builder: (context , setState) => GestureDetector(
            onTap: () {
              setState(() {
                isSelected = true ;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 90),
              margin: const EdgeInsets.only(top: 5, bottom: 0),
              decoration: BoxDecoration(
                border: Border.all(color: getColor(3), width: 3),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                widget.question1.options[2],
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
