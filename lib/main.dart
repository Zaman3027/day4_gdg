import 'package:flutter/material.dart';
import './doubleCounterScreen.dart';
import './model/loginState.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;
  LoginState _loginState;

  @override
  void initState() {
    super.initState();
    _counter = 0;
    _loginState = LoginState.loggedOut;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            LoginStateButton(
              loginState: _loginState,
              changeLoginSate: (LoginState newState) {
                setState(() {
                  _loginState = newState;
                });
              },
            ),
            DoubleCounterScreen(
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
            Builder(
              builder: (BuildContext context) => RaisedButton(
                    onPressed: () {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Login State chnaged to $_loginState"),
                      ));
                    },
                    child: Text("Get Status"),
                  ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter = 0;
            });
          },
          child: Icon(Icons.restore),
        ),
      ),
    );
  }
}

class LoginStateButton extends StatelessWidget {
  final LoginState loginState;
  final Function(LoginState newSate) changeLoginSate;

  const LoginStateButton({Key key, this.loginState, this.changeLoginSate})
      : super(key: key);
  LoginState getNewLoginSate() {
    LoginState newState;
    switch (loginState) {
      case LoginState.loggedIn:
        newState = LoginState.loggedInPro;
        break;
      case LoginState.loggedOut:
        newState = LoginState.loggedIn;
        break;
      case LoginState.loggedInPro:
        newState = LoginState.loggedOut;
        break;
    }
    return newState;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        changeLoginSate(getNewLoginSate());
      },
      child: loginState == LoginState.loggedInPro
          ? Icon(
              Icons.star,
              size: 25,
            )
          : Text(
              loginState == LoginState.loggedOut
                  ? "LOG in"
                  : "Subscribe to Pro",
              style: TextStyle(fontSize: 25),
            ),
    );
  }
}
