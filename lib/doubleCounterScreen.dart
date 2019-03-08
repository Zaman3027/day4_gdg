import 'package:flutter/material.dart';
import './model/loginState.dart';

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
              isIncrementer: true,
          onPressed: increment,
          counter: counter,
        )),
        Expanded(
            child: CounterText(
              isIncrementer: false,
          onPressed: decrement,
          counter: counter,
        ))
      ],
    );
  }
}

class CounterText extends StatefulWidget {
  final Function onPressed;
  final int counter;
  final bool isIncrementer;

  const CounterText({
    Key key,
    this.isIncrementer,
    this.onPressed,
    @required this.counter,
  }) : super(key: key);

  @override
  _CounterTextState createState() => _CounterTextState();
}

class _CounterTextState extends State<CounterText>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Tween<double> textSizeAnimation;
  @override
  void initState() {
    super.initState();
    textSizeAnimation = Tween(begin: 20.0, end: 50.0);
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )
      ..addStatusListener((AnimationStatus f) {
        if (f == AnimationStatus.completed) {
          controller.reverse();
        }
        if (f == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..addListener(() {
        setState(() {});
      });
    
    textSizeAnimation.animate(controller);
    controller.forward();
  }

  int get counter => widget.counter;
  Function get onPressed => widget.onPressed;
  bool get isIncrementer => widget.isIncrementer;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        color: isIncrementer==true?Colors.green:Colors.red,
        onPressed: onPressed,
        child: Text(
          "$counter",
          style: TextStyle(fontSize: 50 * controller.value),
        ),
      ),
    );
  }
}
