import 'package:flutter/material.dart';
import 'home.dart';

class App extends StatelessWidget {
  final String appTitle;
  
  App(this.appTitle);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: this.appTitle,
      theme: ThemeData(
        primarySwatch: null,
        brightness: Brightness.dark,
      ),
      home: Home(),
    );
  }
}
