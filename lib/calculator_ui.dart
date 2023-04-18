import 'package:flutter/material.dart';

class MobileCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '0',
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('x'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton('.'),
              buildButton('0'),
              buildButton('00'),
              buildButton('+'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton('C'),
              buildButton('='),
            ],
          )
        ],
      ),
    );
  }

  Widget buildButton(String text) {
    return Container(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
  
  RaisedButton({required Null Function() onPressed, required Text child}) {}
}


