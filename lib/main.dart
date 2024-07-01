import 'package:flutter/material.dart';
import 'package:flutter_widget_practice/Form/home_page.dart';
import 'package:flutter_widget_practice/Navigator/page_four.dart';
import 'package:flutter_widget_practice/Navigator/page_three.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter practice",
    initialRoute: '/',
    routes: {
      '/pagethree': (context) => PageThree(),
      '/pagefour': (context) => PageFour(),
    },
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage(); //PageOne()
  }
}
