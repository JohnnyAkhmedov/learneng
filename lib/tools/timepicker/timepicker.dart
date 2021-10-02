import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ingliz_tili/home_page/main.dart';
import 'package:hive/hive.dart';

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

  // ignore: unused_element
  Future _showNotification() async {
    var androidDetails = AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription',
        importance: Importance.high);
    var iosDetails = IOSNotificationDetails();
    var genNotifs =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    // DateTime time = TimeofDay();
    // await fltrnotif.schedule(0, 'Mashg\'ulot vaqti bo\'ldi',
    //     "Yangi so\'zlarni yodlashga shoshiling ", time, genNotifs);
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
                  var time = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                      confirmText: "TANLASH",
                      cancelText: "BEKOR QILISH",
                      helpText: "Mashg\'ulot uchun vaqt tanlash");
                  if (time != null && time != TimeOfDay.now()) {
                    var dateBox = await Hive.openBox('DateBox');
                    dateBox.put('hour', time.hour);
                    dateBox.put('minute', time.minute);
                  }
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => MyApp()));

                  var androidDetails = AndroidNotificationDetails(
                      'channelId', 'channelName', 'channelDescription',
                      importance: Importance.high);
                  var iosDetails = IOSNotificationDetails();
                  var genNotifs = NotificationDetails(
                      android: androidDetails, iOS: iosDetails);
                  Time time1 = Time(time!.hour, time.minute, 0);
                  print(time1);
                  // ignore: deprecated_member_use
                  await fltrnotif.showDailyAtTime(
                      0,
                      'Mashg\'ulot vaqti bo\'ldi',
                      "Yangi so\'zlarni yodlashga shoshiling ",
                      time1,
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
