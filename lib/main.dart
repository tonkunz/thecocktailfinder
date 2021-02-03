import 'package:flutter/material.dart';
import 'package:thecocktailfinder/pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Cocktail Finder',
      debugShowCheckedModeBanner: false,
      // Tema da aplicação, pode futuramente ir para um arquivo separado
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.light,
        primaryColor: Color(0xff583d72),
        accentColor: Color(0xffff8e71),
      ),
      home: HomePage(),
    );
  }
}
