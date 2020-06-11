
// Entry Function
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  //Data Types
  int i = 0;                // -2^63 - 2^63
  double d = 0.0;           // 64-bit floating-point
  String s = 'Hello World'; // Doesn't care if ' or "
  bool b = true;

  num n = 0;
  n = 0.0;

  var v = 0.0;              // Picks type which can't be changed afterwards
  //v = "I am a String now"; won't work here

  dynamic dy = 0.0;         // Can change the type afterwards
  dy = "I am a String now"; // Works here

  //Conditionals
  if(b) {}
  else if(i < 0) {}
  else {}

  while(d > 0) {}
  for(int j = 0; j < 10; j++) {}
  for(var c in s.split('')) {}
}

Future<void> futureFunction() async {
  sleep(Duration(seconds: 5));
  print('Good Morning!');
}

class Example {
  int _i;     // There is no capsuling, private variables
  String _s;  // and functions are declared with '_'

  Example(this._i, this._s); // Full Constructor setting i and s;

  Example.secondConstructor(int i) {
    this._i = i;
    this._s = "Test";
  }

  factory Example.factory(int i, String s) {
    return Example(i, s);
  }

  bool function1(int i) {
    return true;
  }

  static void function3(String s) {

  }

  dynamic function2(var v) {

  }
}

class ExampleWidget extends StatefulWidget {
  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      )
    );
  }
}
