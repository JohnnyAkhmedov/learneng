import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:ingliz_tili/data/data.dart';
import 'package:ingliz_tili/main.dart';
import 'package:ingliz_tili/tools/timepicker/timepicker.dart';
// import 'package:ingliz_tili/trainings/second_training/second_variant.dart';

var a = DataOfWords();

// ignore: must_be_immutable
class FinalTest extends StatefulWidget {
  int indeks;
  FinalTest({required this.indeks});

  @override
  _FinalTestState createState() => _FinalTestState(indeks: indeks);
}

class _FinalTestState extends State<FinalTest> {
  late List<TraingTest> traingTest;
  late int testIndex = 0;
  int indeks;
  _FinalTestState({required this.indeks});
  @override
  void initState() {
    super.initState();
    traingTest = [
      TraingTest(
          questWord: a.words[indeks][0]['translation'].toString(),
          answers: [
            Answer(
                t_answer: a.words[indeks][0]['word'].toString(), isRight: true),
            Answer(
                t_answer: a.words[0 + 2][2]['word'].toString(), isRight: false),
            Answer(
                t_answer: a.words[0 + 3][3]['word'].toString(), isRight: false),
            Answer(
                t_answer: a.words[0 + 4][1]['word'].toString(), isRight: false),
          ]),
      TraingTest(
          questWord: a.words[indeks][1]['translation'].toString(),
          answers: [
            Answer(t_answer: a.words[0][0]['word'].toString(), isRight: false),
            Answer(
                t_answer: a.words[indeks][1]['word'].toString(), isRight: true),
            Answer(t_answer: a.words[4][2]['word'].toString(), isRight: false),
            Answer(
                t_answer: a.words[0 + 2][3]['word'].toString(), isRight: false),
          ]),
      TraingTest(
          questWord: a.words[indeks][2]['translation'].toString(),
          answers: [
            Answer(t_answer: a.words[1][1]['word'].toString(), isRight: false),
            Answer(t_answer: a.words[7][4]['word'].toString(), isRight: false),
            Answer(t_answer: a.words[8][3]['word'].toString(), isRight: false),
            Answer(
                t_answer: a.words[indeks][2]['word'].toString(), isRight: true),
          ]),
      TraingTest(
          questWord: a.words[indeks][3]['translation'].toString(),
          answers: [
            Answer(t_answer: a.words[10][1]['word'].toString(), isRight: false),
            Answer(
                t_answer: a.words[indeks][3]['word'].toString(), isRight: true),
            Answer(t_answer: a.words[5][0]['word'].toString(), isRight: false),
            Answer(t_answer: a.words[2][2]['word'].toString(), isRight: false),
          ]),
      TraingTest(
          questWord: a.words[indeks][4]['translation'].toString(),
          answers: [
            Answer(
                t_answer: a.words[indeks][4]['word'].toString(), isRight: true),
            Answer(t_answer: a.words[10][0]['word'].toString(), isRight: false),
            Answer(t_answer: a.words[6][3]['word'].toString(), isRight: false),
            Answer(t_answer: a.words[1][1]['word'].toString(), isRight: false),
          ]),
      TraingTest(questWord: '', answers: [
        Answer(t_answer: '', isRight: true),
        Answer(t_answer: '', isRight: false),
        Answer(t_answer: '', isRight: false),
        Answer(t_answer: '', isRight: false),
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
          height: size.height * 0.65,
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.only(bottom: 40),
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
                padding: const EdgeInsets.only(top: 0),
                child: Text(traingTest[testIndex].questWord,
                    style: TextStyle(color: Colors.black, fontSize: 40)),
              ),
              Spacer(),
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

  final player = AudioCache();
  Widget _answers(Answer answer) {
    return Container(
      width: double.infinity,
      height: 50,
      child: TextButton(
        child: Text(
          answer.t_answer,
          style: TextStyle(fontSize: 30),
        ),
        onPressed: () async {
          var dateBox = await Hive.openBox('DateBox');

          if (answer.isRight == true) {
            player.play('true.mp3',
                mode: PlayerMode.LOW_LATENCY, stayAwake: false);
            setState(() {
              testIndex += 1;
              if (testIndex > 4) {
                if (indeks == 0 && dateBox.get('DateBox') == null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TimePick()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PovtorTrenirovki(
                                indeks: indeks,
                              )));
                }
              }
            });
          } else {
            player.play('false.mp3',
                mode: PlayerMode.MEDIA_PLAYER, stayAwake: false);
            print('wrong');
          }
        },
      ),
    );
  }
}

class TraingTest {
  late String questWord;
  late List<Answer> answers;
  TraingTest({required this.questWord, required this.answers});
}

class Answer {
  // ignore: non_constant_identifier_names
  late String t_answer;
  late bool isRight;
  // ignore: non_constant_identifier_names
  Answer({required this.t_answer, required this.isRight});
}

// ignore: must_be_immutable
class PovtorTrenirovki extends StatelessWidget {
  final indeks;
  PovtorTrenirovki({
    Key? key,
    required this.indeks,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Barakalla siz yakuniy testni muvofaqiyatli yakunladingiz!',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                width: 200,
                height: 50,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinalTest(indeks: indeks)));
                    },
                    child: Text(
                      'Testni qaytarish',
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  width: 200,
                  height: 50,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      child: Text(
                        'Bosh sahifaga qaytish',
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
