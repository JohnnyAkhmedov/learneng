import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ingliz_tili/start.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

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
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
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
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StartPage()));
                  },
                  child: Container(
                      width: size.width * 0.8,
                      height: 50,
                      child: Center(
                          child: Text(
                        'Boshlash',
                        style: TextStyle(fontSize: 25),
                      ))),
                  style: ButtonStyle()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {},
                child: Container(
                    width: size.width * 0.8,
                    height: 50,
                    child: Center(
                        child: Text(
                      'Yangi so\'zlarni tanlash',
                      style: TextStyle(fontSize: 25),
                    ))),
              ),
            )
          ])
        ]),
      ),
    );
  }
}
