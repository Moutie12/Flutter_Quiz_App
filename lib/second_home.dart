import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/question_time_out.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/quizhome.dart';
import 'quiz_mode.dart';

class SecondPage extends StatefulWidget{
  final valueinput;

   const SecondPage({Key? key,required  this.valueinput}): super (key : key);

  @override
  State<SecondPage> createState() => RootSecondPage() ;
}

class RootSecondPage extends State<SecondPage> {

  final QuestionController _questionController = Get.put(QuestionController());

  static const kPrimaryGradient = LinearGradient(
    colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  @override
  Widget build(BuildContext context) {
    Size screenWidth = MediaQuery.of(context).size;
    double rightMargin = screenWidth.width * 0.95; // 100% of the available width
    return Scaffold(
      body:
        Stack(
          children: [
            Image.asset("images/bg.png",
              width: double.infinity,
              fit: BoxFit.fill,),
            Container(
              margin: EdgeInsets.only(top: 120,left: screenWidth.width * 0.8),
              child: const Text("Skip",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),),
            ),
            Container(
              child: Stack(
                children: [
                  Container(
                    margin:  EdgeInsets.only(
                    left: screenWidth.width * 0.7,top: 36),
                    child: Image.asset("images/profile.png",
                    width: 65,
                    height: 65,),),
                   Container(
                     margin: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
                     child: const Text("Welcome : \n",
                       style: TextStyle(
                         fontSize: 20,
                         color : Colors.red,
                       ),),
                   ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 70,horizontal: 35),
                    child:  Text(widget.valueinput
                      ,style:
                    const TextStyle(
                      fontSize: 33,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ],
              ) ,
            ),
            SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 100),
                        width: double.infinity,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF3F4768) , width: 3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child:
                        GetBuilder<QuestionController>(init: QuestionController() , builder: (controller) {
                          return Stack(
                            children: [
                              LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) =>
                                  Container(
                                    width: constraints.maxWidth * controller.animation.value,
                                    decoration: BoxDecoration(
                                      gradient: kPrimaryGradient,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                              ),
                              Text("${(controller.animation.value * 30).round()} Sec",style:
                              const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),),
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                )
            ),
            Expanded(
              child: SizedBox(
                height: screenWidth.height * 0.87 ,
                child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _questionController.questions.length,
                    onPageChanged: _questionController.updateTheQnNum,
                    itemBuilder: (context , index) =>  QuizModel(
                      question1: sample_data[index],correctAnswer : sample_data[index].answer,
                    )),
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Stack(
                    children: [
                      const Text("Question N",style:
                        TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 17,
                        ),),
                      Container(
                        margin: const EdgeInsets.only(left: 89),
                        child: const Text("1",style:
                          TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),),
                      )
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
    ) ;
  }
}