import 'package:flutter/material.dart';
import 'package:ingliz_tili/data.dart';

var data = DataOfWords();

class SecondVariant extends StatefulWidget {
  int indeks;
  SecondVariant({required this.indeks});

  @override
  _SecondVariantState createState() => _SecondVariantState(indeks: indeks);
}

class _SecondVariantState extends State<SecondVariant> {
  int ind = 0;
  String word = '';
  int indeks;
  _SecondVariantState({required this.indeks});
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
          height: size.height * 0.6,
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text('Tarjimasini tog\'ri yozing',
                    style: TextStyle(color: Colors.black54, fontSize: 30)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
                child: Text(data.words[indeks][ind]['translation'].toString(),
                    style: TextStyle(color: Colors.black, fontSize: 50)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                        child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          word = value;
                          print(word);
                        });
                      },
                      decoration: InputDecoration(border: InputBorder.none),
                    )),
                    width: size.width * 0.6,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10))),
              ),
              Container(
                child: TextButton(
                    onPressed: () {
                      if (word.toLowerCase() ==
                          data.words[indeks][ind]['word']!.toLowerCase()) {
                        setState(() {
                          ind += 1;
                          if (ind > 4) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) {
                              return Scaffold();
                            }));
                          }
                        });
                      } else {
                        print('tapped');
                      }
                    },
                    child: Text(
                      'Tekshirish',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10)),
                width: size.width * 0.5,
                height: size.height * 0.07,
              )
            ],
          ),
        )));
  }
}
