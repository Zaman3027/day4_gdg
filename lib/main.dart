import 'package:flutter/material.dart';
import './doubleCounterScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: DoubleCounterScreen(
            counter: _counter,
            increment: () {
              setState(() {
                _counter++;
              });
            },
            decrement: () {
              setState(() {
                _counter--;
              });
            },
          ),
        ),
      ),
    );
  }
}
