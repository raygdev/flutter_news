import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News API',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hacker News'),
        ),
        body: Container(
          child: Text('Contianer rendering'),
        ),
      ),
    );
  }
}