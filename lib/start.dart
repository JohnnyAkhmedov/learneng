import 'package:flutter/material.dart';
import 'package:ingliz_tili/data.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ingliz_tili/trainings/first_variant.dart';
// import 'package:ingliz_tili/proverka.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

int ind = 0;
var lastIndex;

class ExampleHive {
  void doSome() async {
    var box = await Hive.openBox('MyTestBox');
    await box.put('name', 'Jonibek');
    box.close();
  }
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var engData = DataOfWords().words[ind]['word'];
    var uzData = DataOfWords().words[ind]['translation'];
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        title: Text('LearnEng'),
      ),
      body: Center(
          child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        borderOnForeground: true,
        elevation: 10,
        child: Container(
          height: size.height * 0.60,
          width: size.width * 0.9,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'So\'zni eslab qoling',
                    style: TextStyle(fontSize: 24, color: Colors.black54),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Text(
                    '$engData',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  '$uzData',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30,
                      fontWeight: FontWeight.w400),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          color: Colors.white,
                          shape: BoxShape.circle),
                      height: 80,
                      width: 80,
                      child: IconButton(
                          onPressed: () async {
                            var box = await Hive.openBox('MyTestBox');
                            final a = await box.get('lastIndex');
                            print(a);
                            setState(() {
                              ind = a;
                            });
                          },
                          icon: Icon(
                            Icons.volume_down_rounded,
                            size: 50,
                            color: Colors.blueAccent,
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            color: Colors.blueAccent),
                        height: 70,
                        width: double.infinity,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                ind += 1;

                                print(ind);
                                // var box = await Hive.openBox('MyTestBox');
                                // await box.put('lastIndex', ind);
                                // lastIndex = box;
                                // final a = box.get('lastIndex') as int?;
                                // ind = ind;

                                if (ind > 5) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TreiningStart()));
                                }
                              });
                            },
                            hoverColor: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Davom etish',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                Icon(
                                  Icons.navigate_next,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ],
                            ))),
                  ],
                ),
              ]),
        ),
      )),
    );
  }
}

class TreiningStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Siz bugungilik 5 ta so\'zni yodlab bo\'ldingiz so\'zlar esingizda qolishi uchun mashqlarni bajaring',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              height: 50,
              width: 200,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirstVariantTraining()));
                },
                child: Text('Mashqni boshlash',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    )),
              )),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              height: 50,
              width: 200,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StartPage()));
                },
                child: Text('So\'zlarni qaytarish',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    )),
              ))
        ]),
      )),
    );
  }
}
