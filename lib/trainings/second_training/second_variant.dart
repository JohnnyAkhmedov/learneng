import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ingliz_tili/data/data.dart';
import 'package:ingliz_tili/learning/start.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ingliz_tili/trainings/third_training/third_training.dart';

var data = DataOfWords();
AudioCache playSound = AudioCache();

class SecondVariant extends StatefulWidget {
  final indeks;
  SecondVariant({required this.indeks});

  @override
  _SecondVariantState createState() => _SecondVariantState(indeks: indeks);
}

class _SecondVariantState extends State<SecondVariant> {
  late FlutterLocalNotificationsPlugin fltrnotif;
  @override
  void initState() {
    super.initState();
    var androidInit = AndroidInitializationSettings('app_icon');
    var iosInit = IOSInitializationSettings();
    var initSettings =
        InitializationSettings(android: androidInit, iOS: iosInit);
    fltrnotif = FlutterLocalNotificationsPlugin();
    fltrnotif.initialize(
      initSettings,
    );
  }

  Future notificationSelected(String payload) async {}
  // ignore: unused_element
  Future _showNotification() async {
    var androidDetails = AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription',
        importance: Importance.high);
    var iosDetails = IOSNotificationDetails();
    var genNotifs =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    await fltrnotif.show(0, 'title', 'body', genNotifs);
  }

  int ind = 0;
  String word = '';
  int indeks;
  _SecondVariantState({required this.indeks});
  final _wordController = TextEditingController();
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
        body: SingleChildScrollView(
          child: Center(
              child: Container(
            width: size.width * 0.8,
            height: size.height * 0.65,
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
                  padding: const EdgeInsets.only(top: 0, right: 20, left: 20),
                  child: Text(data.words[indeks][ind]['translation'].toString(),
                      style: TextStyle(color: Colors.black, fontSize: 50)),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Center(
                          child: TextFormField(
                        controller: _wordController,
                        onChanged: (value) {
                          setState(() {
                            word = value;
                            print(word);
                          });
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "So'zni kiriting"),
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
                          player.play('true.mp3',
                              mode: PlayerMode.MEDIA_PLAYER, stayAwake: false);
                          setState(() {
                            _wordController.clear();

                            ind += 1;
                            if (ind > 4) {
                              // _showNotification();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RepeatTraining2(indeks: indeks)));
                            }
                          });
                        } else {
                          player.play('false.mp3',
                              mode: PlayerMode.MEDIA_PLAYER, stayAwake: false);
                          setState(() {
                            _wordController.clear();
                          });

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
          )),
        ));
  }
}

// ignore: must_be_immutable
// ignore: must_be_immutable
class RepeatTraining2 extends StatefulWidget {
  int indeks;
  RepeatTraining2({required this.indeks});

  @override
  RepeatTrainingState createState() => RepeatTrainingState(indeks: indeks);
}

class RepeatTrainingState extends State<RepeatTraining2> {
  int indeks;
  RepeatTrainingState({required this.indeks});
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
                'Ikkinchi mashq tugadi!',
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
                              builder: (context) =>
                                  SecondVariant(indeks: indeks)));
                    },
                    child: Text(
                      'Mashqni qaytarish',
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ThirdVariant(indeks: indeks)));
                      },
                      child: Text(
                        'Davom etish',
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
