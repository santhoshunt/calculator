import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget button(String text) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        color: Colors.blue[400],
        width: _width * 0.2449,
        height: _height * 0.15,
        child: RaisedButton(
          elevation: 20,
          onPressed: null,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              decorationThickness: 6,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topRight,
              child: Text(
                "Field",
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ),
        Divider(),
        //keyboard
        Column(
          children: [
            Container(
              child: Row(
                children: [
                  button('x'),
                  button('/'),
                  button('⌫'),
                  button("C"),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  button('1'),
                  button('2'),
                  button('3'),
                  button("+"),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  button('4'),
                  button('5'),
                  button('6'),
                  button("-"),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  button('7'),
                  button('8'),
                  button('9'),
                  button("="),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
