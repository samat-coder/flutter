import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyP9 extends StatefulWidget {
  const MyP9({super.key});

  @override
  State<MyP9> createState() => _MyP9State();
}

class _MyP9State extends State<MyP9> {
  String _input = ''; 
  String _result = '0';


  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _result = '0';
      } else if (value == '=') {
        try {
          _result = _evaluateExpression(_input);
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _input += value;
      }
    });
  }


  String _evaluateExpression(String expression) {
    try {

      String sanitizedExpression =
          expression.replaceAll('×', '*').replaceAll('÷', '/');


      Parser parser = Parser();
      Expression exp = parser.parse(sanitizedExpression);
      ContextModel contextModel = ContextModel();

      double eval = exp.evaluate(EvaluationType.REAL, contextModel);
      
      return eval.toStringAsFixed(2);
    } catch (e) {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    _input,
                    style: const TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                  Text(
                    _result,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.0,
              ),
              itemCount: _buttons.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => _onButtonPressed(_buttons[index]),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isOperator(_buttons[index])
                          ? Colors.orange
                          : Colors.grey[800],
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      _buttons[index],
                      style: const TextStyle(fontSize: 24.0),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  final List<String> _buttons = [
    '7', '8', '9', '÷',
    '4', '5', '6', '×',
    '1', '2', '3', '-',
    'C', '0', '=', '+',
  ];

  bool _isOperator(String value) {
    return value == '+' || value == '-' || value == '×' || value == '÷' || value == '=';
  }
}
