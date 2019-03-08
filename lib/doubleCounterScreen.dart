import 'package:flutter/material.dart';

class DoubleCounterScreen extends StatelessWidget {
  final int counter;
  final Function increment;
  final Function decrement;

  const DoubleCounterScreen({
    Key key,
    @required this.counter,
    @required this.increment,
    @required this.decrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: CounterText(
              onPressed: increment,
             counter: counter,
        )),
        Expanded(
            child: CounterText(
              onPressed: decrement,
              counter: counter,
        ))
      ],
    );
  }
}

class CounterText extends StatelessWidget {
  final Function onPressed;
  final int counter;

  const CounterText({Key key, this.onPressed, @required this.counter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: onPressed,
        child: Text("$counter"),
      ),
    );
  }
}
