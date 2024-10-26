import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  //variables
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = "";
  var output = "";
  var operation = "";
  var hideInput = false;
  var outputSize = 3.0;

  final operatorColor = Color(0xff272727);
  static const buttonColor = Color(0xff191919);
  final orangeColor = Color(0xffD9802E);

  onButtonClick(value) {
    print("value  == "+value);

     if (value == "=") {
      if (input.isNotEmpty) {
        var userInput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        input = output;
        hideInput = true;
        outputSize = 52;
      }
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 34;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        //input output area
        Expanded(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                hideInput ? "" : input,
                style: const TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                output,
                style: TextStyle(
                  fontSize: outputSize,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        )),
        Row(
          children: [
            button(text: "7"),
            button(text: "8"),
            button(text: "9"),
            button(
                text: "x", tColor: orangeColor, buttonBgColor: operatorColor),
          ],
        ),
        Row(
          children: [
            button(text: "4"),
            button(text: "5"),
            button(text: "6"),
            button(
                text: "-", tColor: orangeColor, buttonBgColor: operatorColor),
          ],
        ),
        Row(
          children: [
            button(text: "1"),
            button(text: "2"),
            button(text: "3"),
            button(
                text: "+", tColor: orangeColor, buttonBgColor: operatorColor),
          ],
        ),
        Row(
          children: [
            button(text: "0"),
            button(text: "=", buttonBgColor: orangeColor),
          ],
        ),
      ]),
    );
  }

  // calculate button to perfrom task
  Widget button({text, tColor = Colors.black, buttonBgColor = buttonColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(22),
            // primary: buttonBgColor,
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
