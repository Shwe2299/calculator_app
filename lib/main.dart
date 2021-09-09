import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget calclateButton(String btnTxt, Color btnColor, Color txtColor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          //TODO add function for button press
          calculate(btnTxt);
        },
        child: Text(
          '$btnTxt',
          style: TextStyle(
            fontSize: 35,
            color: txtColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            primary: btnColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Calculator",
        ),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // SingleChildScrollView(
            //   scrollDirection: Axis.vertical,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: <Widget>[
            //       Padding(
            //         padding: const EdgeInsets.all(10.0),
            //         child: Text(
            //           '$text',
            //           textAlign: TextAlign.left,
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 100,
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            //Calculator display
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 100),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //call button functions here
                //calclateButton(btnTxt, btnColor, txtColor)
                calclateButton('AC', Colors.grey, Colors.black),
                calclateButton('+/-', Colors.grey, Colors.black),
                calclateButton('%', Colors.grey, Colors.black),
                calclateButton('÷', Colors.amber.shade900, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //Rows of 4 btns w height spacing of 10
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //call button functions here
                //calclateButton(btnTxt, btnColor, txtColor)
                calclateButton('7', Colors.grey.shade800, Colors.white),
                calclateButton('8', Colors.grey.shade800, Colors.white),
                calclateButton('9', Colors.grey.shade800, Colors.white),
                calclateButton('×', Colors.amber.shade900, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //call button functions here
                //calclateButton(btnTxt, btnColor, txtColor)
                calclateButton('4', Colors.grey.shade800, Colors.white),
                calclateButton('5', Colors.grey.shade800, Colors.white),
                calclateButton('6', Colors.grey.shade800, Colors.white),
                calclateButton('-', Colors.amber.shade900, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //call button functions here
                //calclateButton(btnTxt, btnColor, txtColor)
                calclateButton('1', Colors.grey.shade800, Colors.white),
                calclateButton('2', Colors.grey.shade800, Colors.white),
                calclateButton('3', Colors.grey.shade800, Colors.white),
                calclateButton('+', Colors.amber.shade900, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            //row of 0, . =
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //for button 0
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                    primary: Colors.grey.shade800,
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  onPressed: () {
                    //btn 0 function
                    calculate(text);
                  },
                ),
                calclateButton('.', Colors.grey.shade800, Colors.white),
                calclateButton('=', Colors.amber.shade900, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  dynamic text = '0';

  dynamic num1 = 0;

  dynamic num2 = 0;

  dynamic result = '';

  dynamic finalResult = '';

  dynamic opr = '';

  dynamic preOpr = '';

  void calculate(btnTxt) {
    if (btnTxt == 'AC') {
      text = '0';
      num1 = 0;
      num2 = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnTxt == '=') {
      if (preOpr == '+') {
        //if preOpr is + then do add function
        finalResult = addition();
      } else if (preOpr == '-') {
        //if preopr is -
        finalResult = subtract();
      } else if (preOpr == '×') {
        //if preopr is *
        finalResult = multiply();
      } else if (preOpr == '÷') {
        //if preopr is /
        finalResult = divide();
      } else if (btnTxt == '+' ||
          btnTxt == '-' ||
          btnTxt == '×' ||
          btnTxt == '÷') {
        if (num1 == 0) {
          num1 = double.parse(result);
        } else {
          num2 = double.parse(result);
        }
        if (opr == '+') {
          finalResult = addition();
        } else if (opr == '-') {
          //if preopr is -
          finalResult = subtract();
        } else if (opr == '×') {
          //if preopr is *
          finalResult = multiply();
        } else if (opr == '÷') {
          //if preopr is /
          finalResult = divide();
        }
        preOpr = opr;
        opr = btnTxt;
        result = '';
      } else if (btnTxt == '%') {
        result = num1 / 100;
        finalResult = hasDecimals(result);
      } else if (btnTxt == '.') {
        if (!result.toString().contains('.')) {
          result = result.toString() + '.';
        }
        finalResult = result;
      } else if (btnTxt == '+/-') {
        result.toString().startsWith('-')
            ? result = result.toString().substring(1)
            : result = '-' + result.toString();
        finalResult = result;
        // if (result.toString().startsWith('-')) {
        //   result = result.toString().substring(1);
        // } else {
        //   result = '-' + result.toString();
        // }
        // finalResult = result;
      } else {
        result = result + btnTxt;
        finalResult = result;
      }
    }
  }

  String addition() {
    result = (num1 + num2).toString();
    num1 = double.parse(result); //
    return hasDecimals(result);
  }

  String subtract() {
    result = (num1 - num2).toString();
    num1 = double.parse(result);
    return hasDecimals(result);
  }

  String multiply() {
    result = (num1 * num2).toString();
    num1 = double.parse(result);
    return hasDecimals(result);
  }

  String divide() {
    result = (num1 / num2).toString();
    num1 = double.parse(result);
    return hasDecimals(result);
  }

  String hasDecimals(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> spiltDecimal = result.toString().split('.');
      if (!(int.parse(spiltDecimal[1]) > 0))
        return result = spiltDecimal[0].toString();
    }
    return result;
  }
}
