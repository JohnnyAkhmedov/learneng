import 'package:flutter/material.dart';
import 'package:ingliz_tili/data.dart';

var a = DataOfWords();

class FirstVariantTraining extends StatefulWidget {
  const FirstVariantTraining({Key? key}) : super(key: key);

  @override
  _FirstVariantTrainingState createState() => _FirstVariantTrainingState();
}

class _FirstVariantTrainingState extends State<FirstVariantTraining> {
  late List<TraingTest> traingTest;
  late int testIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    traingTest = [
      TraingTest(questWord: a.words[0]['word'].toString(), answers: [
        Answer(t_answer: a.words[0]['translation'].toString(), isRight: true),
        Answer(
            t_answer: a.words[0 + 2]['translation'].toString(), isRight: false),
        Answer(
            t_answer: a.words[0 + 3]['translation'].toString(), isRight: false),
        Answer(
            t_answer: a.words[0 + 4]['translation'].toString(), isRight: false),
      ]),
      TraingTest(questWord: a.words[1]['word'].toString(), answers: [
        Answer(t_answer: a.words[0]['translation'].toString(), isRight: false),
        Answer(t_answer: a.words[1]['translation'].toString(), isRight: true),
        Answer(t_answer: a.words[4]['translation'].toString(), isRight: false),
        Answer(
            t_answer: a.words[0 + 2]['translation'].toString(), isRight: false),
      ]),
      TraingTest(questWord: a.words[2]['word'].toString(), answers: [
        Answer(t_answer: a.words[1]['translation'].toString(), isRight: false),
        Answer(t_answer: a.words[7]['translation'].toString(), isRight: false),
        Answer(t_answer: a.words[8]['translation'].toString(), isRight: false),
        Answer(t_answer: a.words[2]['translation'].toString(), isRight: true),
      ]),
      TraingTest(questWord: a.words[3]['word'].toString(), answers: [
        Answer(t_answer: a.words[10]['translation'].toString(), isRight: false),
        Answer(t_answer: a.words[3]['translation'].toString(), isRight: true),
        Answer(t_answer: a.words[5]['translation'].toString(), isRight: false),
        Answer(t_answer: a.words[2]['translation'].toString(), isRight: false),
      ]),
      TraingTest(questWord: a.words[4]['word'].toString(), answers: [
        Answer(t_answer: a.words[4]['translation'].toString(), isRight: true),
        Answer(t_answer: a.words[10]['translation'].toString(), isRight: false),
        Answer(t_answer: a.words[6]['translation'].toString(), isRight: false),
        Answer(t_answer: a.words[1]['translation'].toString(), isRight: false),
      ]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
          title: Text('Mashq'),
        ),
        body: Center(
            child: Container(
          width: size.width * 0.8,
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('Tarjimasini tanlang',
                    style: TextStyle(color: Colors.black54, fontSize: 30)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(traingTest[testIndex].questWord,
                    style: TextStyle(color: Colors.black, fontSize: 50)),
              ),
              Column(
                children: traingTest[testIndex]
                    .answers
                    .map((item) => _answers(item))
                    .toList(),
              )
            ],
          ),
        )));
  }

  Widget _answers(Answer answer) {
    return TextButton(
      child: Text(
        answer.t_answer,
        style: TextStyle(fontSize: 30),
      ),
      onPressed: () {
        if (answer.isRight == true) {
          setState(() {
            testIndex += 1;
          });
          if (testIndex > 4) {
            print('trenirovka tugadi');
          }
        } else {
          print('wrong');
        }
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
  Answer({required this.t_answer, required this.isRight});
}
