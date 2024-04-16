import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: const CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  //variables
  var input = "";
  var output = "";
  var operation = "";

  onButonClick(value) {
    if (value == "AC") {
      input = "";
      output = "";
    } else if (value == "<") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      } else if (value == "=") {
        if (input.isNotEmpty) {
          var userInput = input;
          userInput = input.replaceAll("x", "*");

          Parser p = Parser();
          Expression expression = p.parse(userInput);
          ContextModel cm = ContextModel();
          var finalValue = expression.evaluate(EvaluationType.REAL, cm);
          output = finalValue.toString();
          input = output;
        } else {
          input = input + value;
        }
        setState(() {

        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      //input and output area
      body: Column(
        children: [
          Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(input, style: const TextStyle(
                        fontSize: 48, color: Colors.white),),
                    const SizedBox(height: 20),
                    Text(output, style: TextStyle(
                        fontSize: 32, color: Colors.white.withOpacity(0.8)),),
                    const SizedBox(height: 20),
                  ],
                ),
              )
          ),
          //expanded widget screen ki resolution k hissab s sari jaga leta h
          // like optimzed app

          //buttonsArea
          Row(
            children: [
              button(
                text: "AC",
                buttonBgColor: operatorColor,
                textColor: Colors.orange,
              ),
              button(
                text: "<",
                buttonBgColor: operatorColor,
                textColor: Colors.orange,
              ),
              button(
                text: "em",
                buttonBgColor: operatorColor,
                textColor: Colors.orange,
              ),
              button(
                text: "/",
                buttonBgColor: operatorColor,
                textColor: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(
                text: "x",
                buttonBgColor: operatorColor,
                textColor: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(
                text: "-",
                buttonBgColor: operatorColor,
                textColor: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(
                text: "+",
                buttonBgColor: operatorColor,
                textColor: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              button(
                text: "%",
              ),
              button(
                text: "0",
              ),
              button(
                text: ".",
              ),
              button(
                  text: "=", buttonBgColor: Colors.orange
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({
    //makin button widget and calling it uper many times
    text,
    textColor = Colors.white,
    buttonBgColor = buttonColor,
    //making {} brackets and these parameters will allow you to give seprate text,color to each buttons
  }) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(8),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(22),
                  backgroundColor: buttonBgColor,
                ),
                onPressed: () {
                  // onButtonClick(text);
                },
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                      fontWeight: FontWeight.bold),
                ))));
  }
}


