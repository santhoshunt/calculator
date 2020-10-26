import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String str = "";
  void pressed(String text) {}
  Widget button(String text, int ch) {
    var color;
    if (ch == 1) {
      color = Colors.blue;
    } else if (ch == 2) {
      color = Colors.green;
    } else {
      color = Colors.orange;
    }
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: _width * 0.2449,
        height: _height * 0.12,
        child: RaisedButton(
          color: color,
          elevation: 20,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              decorationThickness: 2,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            if (ch == 1) {
              str += text;
              setState(() {
                str;
              });
            } else if (ch == 2 && text == '=') {
              str = str.replaceAll('x', '*');
              print(str);

              try {
                Parser p = Parser();
                Expression exp = p.parse(str);

                ContextModel cm = ContextModel();
                str = '${exp.evaluate(EvaluationType.REAL, cm)}';
              } catch (e) {
                str = "Error";
              }

              setState(() {
                str;
              });
            } else if (ch == 2) {
              str += text;
              setState(() {
                str;
              });
            } else if (text == "C") {
              str = "";
              setState(() {
                str;
              });
            } else {
              str = str.substring(0, str.length - 1);
              setState(() {
                str;
              });
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
              child: Text(
                str,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),

        //keyboard
        Column(
          children: [
            Container(
              child: Row(
                children: [
                  button('x', 2),
                  button('/', 2),
                  button('⌫', 3),
                  button("C", 3),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  button('1', 1),
                  button('2', 1),
                  button('3', 1),
                  button("+", 2),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  button('4', 1),
                  button('5', 1),
                  button('6', 1),
                  button("-", 2),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  button('7', 1),
                  button('8', 1),
                  button('9', 1),
                  button("=", 2),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  button('.', 1),
                  button('0', 1),
                  button('00', 1),
                  button("^", 2),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
