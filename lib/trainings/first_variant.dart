import 'package:flutter/material.dart';

class FirstVariantTraining extends StatefulWidget {
  const FirstVariantTraining({Key? key}) : super(key: key);

  @override
  _FirstVariantTrainingState createState() => _FirstVariantTrainingState();
}


class _FirstVariantTrainingState extends State<FirstVariantTraining> {
  late List<TraingTest> traingTest;
  late int testIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    traingTest = [
      TraingTest(questWord: 'hi',answers: [
        Answer(t_answer:'salom',isRight: true),
        Answer(t_answer:'hayr',isRight: false),
        Answer(t_answer:'ertaga',isRight: false),
        Answer(t_answer:"noto\'g\'ri",isRight: false),
      ]),
      TraingTest(questWord: 'good bye',answers: [
        Answer(t_answer:'salom',isRight: false),
        Answer(t_answer:'hayr',isRight: true),
        Answer(t_answer:'ertaga',isRight: false),
        Answer(t_answer:"noto\'g\'ri",isRight: false),
      ]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mashq'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          margin:EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
                borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('Tarjimasini tanlang',style: TextStyle(color:Colors.black54,fontSize: 30)),
              ),


              Padding(
                padding: const EdgeInsets.only(top:10),
                child: Text(traingTest[testIndex].questWord,style: TextStyle(color:Colors.black,fontSize: 50)),
              ),
            Column(
              children: traingTest[testIndex].answers.map((item) => _answers(item)).toList(),
            )

            ],
          ),
        )
      )
    );
  }
Widget _answers(Answer answer){
    return TextButton(
        child:Text(answer.t_answer,style: TextStyle(fontSize: 30),),
      onPressed: (){

      },
      );

}
}
class TraingTest {
  late String questWord;
  late List<Answer> answers;
  TraingTest({required this.questWord, required this.answers});
}
class Answer {
  late String t_answer;
  late bool isRight;
  Answer({required this.t_answer,required this.isRight});
}