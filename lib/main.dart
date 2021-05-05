import 'package:flutter/material.dart';
//1. imported local authentication plugin
import 'package:open_book/splash_screen.dart';
import 'package:open_book/search.dart';
import 'package:open_book/results.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinte Books',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: load(),
      routes: {
        'splash': (context) => load(),
        'search': (context) => search(),
        'results' : (context) => results()
      },
    );
  }
}