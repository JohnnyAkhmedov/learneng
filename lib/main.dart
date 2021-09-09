import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ingliz_tili/start.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ingliz_tili/trainings/first_variant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'English',
        theme: ThemeData(
          textTheme: GoogleFonts.aladinTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.indigo,
        ),
        home: Page());
    // home: FirstVariantTraining());
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 10)),
              child: Text(
                'LearnEng',
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Text('5 ta so\'zni yodlashga tayyormisiz?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400)),
            SizedBox(
              height: size.height * 0.2,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  width: 300,
                  height: 50,
                  child: TextButton(
                      onPressed: () async {
                        var box = await Hive.openBox('MyBox');
                        var dateBox = await Hive.openBox('DateBox');
                        var indeks = await box.get('MyBox');
                        if (await dateBox.get('DateBox') == null) {
                          dateBox.put('DateBox', DateTime.now());
                        } else {
                          print(await dateBox.get('DateBox'));
                        }
                        if (await box.get('MyBox') == null) {
                          box.put('MyBox', 0);
                        } else {
                          indeks = indeks + 1;
                          box.put('MyBox', indeks);
                          print(await box.get('MyBox'));
                        }
                        if (DateTime.now()
                            .isAfter(await dateBox.get('DateBox'))) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StartPage(
                                        indeks: indeks,
                                      )));
                        }
                      },
                      child: Center(
                        child: Text(
                          'Boshlash',
                          style: TextStyle(fontSize: 25),
                        ),
                      )),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    width: 300,
                    height: 50,
                    child: TextButton(
                        onPressed: collectingData,
                        child: Center(
                          child: Text(
                            'Yangi so\'zlarni tanlash',
                            style: TextStyle(fontSize: 25),
                          ),
                        )),
                  )),
              OutlinedButton(
                  onPressed: comparingTheDates, child: Text('compare'))
            ])
          ]),
        ),
      ),
    );
  }
}

void comparingTheDates() async {
  var box = Hive.box('lastDate');
  final date = await box.get('lastDate');
  if (DateTime.now().isAfter(date)) {
    print('true');
  } else {
    print('false');
  }
}

void collectingData() async {
  var box = await Hive.openBox('lastDate');
  box.put('lastDate', DateTime.now());
  final a = await box.get('lastDate');
  print(a);
}
