import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = '';

  Widget btn(String textt) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result += textt;
          });
        },
        child: Text(textt));
  }

  clearr() {
    setState(() {
      result = '';
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn('1'),
              btn('2'),
              btn('3'),
              btn('4'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn('5'),
              btn('6'),
              btn('7'),
              btn('8'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn('9'),
              btn('0'),
              btn('+'),
              btn('-'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn('*'),
              btn('/'),
              ElevatedButton(onPressed: clearr, child: Text('clear')),
              ElevatedButton(onPressed: output, child: Text('=')),
            ],
          ),
        ],
      ),
    );
  }
}
