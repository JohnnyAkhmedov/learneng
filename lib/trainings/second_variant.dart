import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ingliz_tili/data.dart';
import 'package:ingliz_tili/start.dart';

var data = DataOfWords();

class SecondVariant extends StatefulWidget {
  int indeks;
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
  Future _showNotification() async {
    var androidDetails = AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription',
        importance: Importance.high);
    var iosDetails = IOSNotificationDetails();
    var genNotifs =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    Time time = Time(15, 8, 0);
    await fltrnotif.showDailyAtTime(0, 'Mashg\'ulot vaqti bo\'ldi',
        "Yangi so\'zlarni yodlashga shoshiling ", time, genNotifs);
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
                          setState(() {
                            _wordController.clear();

                            ind += 1;
                            if (ind > 4) {
                              _showNotification();
                              if (indeks == 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => TimePick()));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TreiningStart(indeks: indeks)));
                              }
                            }
                          });
                        } else {
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

class TimePick extends StatefulWidget {
  TimePick({Key? key}) : super(key: key);

  @override
  _TimePickState createState() => _TimePickState();
}

class _TimePickState extends State<TimePick> {
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

  Future _showNotification() async {
    var androidDetails = AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription',
        importance: Importance.high);
    var iosDetails = IOSNotificationDetails();
    var genNotifs =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    Time time = Time(15, 37, 0);
    await fltrnotif.showDailyAtTime(0, 'Mashg\'ulot vaqti bo\'ldi',
        "Yangi so\'zlarni yodlashga shoshiling ", time, genNotifs);
    await fltrnotif.show(0, 'title', 'body', genNotifs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Text(
              'Barakalla siz birinchi mashqdan o\'tdingiz endi so\'zlarni yod olish uchun o\'zingizga qulay bo\'lgan vaqtni tanlang.',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              height: 50,
              width: 200,
              child: TextButton(
                onPressed: () async {
                  showTimePicker(
                      initialTime: TimeOfDay.now(), context: context);
                  var time1 = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );

                  var androidDetails = AndroidNotificationDetails(
                      'channelId', 'channelName', 'channelDescription',
                      importance: Importance.high);
                  var iosDetails = IOSNotificationDetails();
                  var genNotifs = NotificationDetails(
                      android: androidDetails, iOS: iosDetails);
                  Time time = Time(time1!.hour, time1.minute, 0);
                  print(time);
                  await fltrnotif.showDailyAtTime(
                      0,
                      'Mashg\'ulot vaqti bo\'ldi',
                      "Yangi so\'zlarni yodlashga shoshiling ",
                      time,
                      genNotifs);
                  await fltrnotif.show(
                      0, 'Belgilangan vaqt o\'rnatildi', 'body', genNotifs);
                },
                child: Text('Vaqtni tanlash',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    )),
              )),
        ]),
      )),
    );
  }
}
