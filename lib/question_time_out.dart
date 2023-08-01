import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/score.dart';
import 'package:flutter/material.dart';

class QuestionController extends GetxController with SingleGetTickerProviderMixin{

  late AnimationController _animationController ;
  late Animation _animation ;
  late  int numberCorrectAnswers = 0 ;
  late int value = 1 ;

  Animation get animation => _animation ;

  final List<Question> _questions = sample_data.map(
      (question) => Question(
          id: question.id,
          question: question.question,
          answer: question.answer,
          options: question.options)
  ).toList();

  List<Question> get questions => _questions;

  @override
  void onInit() {
    if (value != _questions.length) {
      _animationController = AnimationController(
        duration: const Duration(seconds: 30),
        vsync: this,
      );

      _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
        ..addListener(() {
          update();
        });

      _animationController.forward();
    } else {
      // Navigate to the 'Score' screen
      Get.to(() => const Score());
    }
  }

  void updateTheQnNum(int index) {
    value = index + 1;
  }

  void rr() {
    _animationController.reset();
    _animationController.forward();
  }




}
