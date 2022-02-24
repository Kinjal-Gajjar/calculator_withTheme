import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int firstNum;
  late int secondNum;
  late String history = '';
  late String textTodisplay = '';
  late String res;
  late String operation;

  void btnclicked(String btnvalue) {
    print(btnvalue);
    if (btnvalue == 'C') {
      textTodisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnvalue == 'AC') {
      textTodisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnvalue == '+/-') {
      if (textTodisplay[0] != '-') {
        res = '-' + textTodisplay;
      } else {
        res = textTodisplay.substring(1);
      }
    } else if (btnvalue == '<') {
      res = textTodisplay.substring(0, textTodisplay.length - 1);
    } else if (btnvalue == '+' ||
        btnvalue == '-' ||
        btnvalue == 'X' ||
        btnvalue == '/') {
      firstNum = int.parse(textTodisplay);
      res = '';
      operation = btnvalue;
    } else if (btnvalue == '=') {
      secondNum = int.parse(textTodisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'X') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum / secondNum).toString();
        // res = (firstNum ~/ secondNum).toString(); integer value
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textTodisplay + btnvalue).toString();
    }
    setState(() {
      textTodisplay = res;
    });
  }

  Widget customebutton(String btnvalue, Color colorname) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
          onPressed: () => btnclicked(btnvalue),
          child: Text(
            '$btnvalue',
            style: TextStyle(
                fontSize: 20.0,
                color: switchvalue ? Colors.white : Colors.black),
          ),
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
              backgroundColor: MaterialStateProperty.all(
                colorname,
              ),
              elevation: MaterialStateProperty.all(8),
              shape: MaterialStateProperty.all(CircleBorder()),
              side: MaterialStateProperty.all(BorderSide(
                style: BorderStyle.none,
              )))),
    ));
  }

  bool switchvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: switchvalue ? Color(0xff474B4D) : Color(0xffFAFAFB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                history,
                style: TextStyle(
                    fontSize: 24,
                    color: switchvalue ? Colors.grey : Colors.grey[600]),
              ),
            ),
            alignment: Alignment(1.0, 1.0),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                textTodisplay,
                style: TextStyle(
                    fontSize: 48,
                    color: switchvalue ? Colors.white : Colors.black87),
              ),
            ),
            alignment: Alignment(1.0, 1.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                  activeColor: switchvalue ? Colors.white : Colors.black,
                  value: switchvalue,
                  onChanged: (newv) {
                    setState(() {
                      switchvalue = newv;
                    });
                  }),
              Text(
                switchvalue ? 'SWITCH TO LIGHT THEME' : 'SWITCH TO DARK THEME',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              customebutton(
                'AC',
                switchvalue ? Color(0xff2FDB82C) : Color(0xffFEB92D),
              ),
              customebutton(
                'C',
                switchvalue ? Color(0xff4A4339) : Color(0xffF5EFE3),
              ),
              customebutton(
                '<',
                switchvalue ? Color(0xff4A4339) : Color(0xffF5EFE3),
              ),
              customebutton(
                '/',
                switchvalue ? Color(0xff48335C) : Color(0xffE1D5E9),
              ),
            ],
          ),
          Row(
            children: [
              customebutton(
                '9',
                switchvalue ? Color(0xff2f3133) : Color(0xffF4F5F7),
              ),
              customebutton(
                '8',
                switchvalue ? Color(0xff2f3133) : Color(0xffF4F5F7),
              ),
              customebutton(
                '7',
                switchvalue ? Color(0xff2f3133) : Color(0xffF4F5F7),
              ),
              customebutton(
                'X',
                switchvalue ? Color(0xff48335C) : Color(0xffE1D5E9),
              ),
            ],
          ),
          Row(
            children: [
              customebutton(
                '6',
                switchvalue ? Color(0xff2f3133) : Color(0xffF4F5F7),
              ),
              customebutton(
                '5',
                switchvalue ? Color(0xff2f3133) : Color(0xffF4F5F7),
              ),
              customebutton(
                '4',
                switchvalue ? Color(0xff2f3133) : Color(0xffF4F5F7),
              ),
              customebutton(
                '-',
                switchvalue ? Color(0xff48335C) : Color(0xffE1D5E9),
              ),
            ],
          ),
          Row(
            children: [
              customebutton(
                '3',
                switchvalue ? Color(0xff2f3133) : Color(0xffF4F5F7),
              ),
              customebutton(
                '2',
                switchvalue ? Color(0xff2f3133) : Color(0xffF4F5F7),
              ),
              customebutton(
                '1',
                switchvalue ? Color(0xff2f3133) : Color(0xffF4F5F7),
              ),
              customebutton(
                '+',
                switchvalue ? Color(0xff48335C) : Color(0xffE1D5E9),
              ),
            ],
          ),
          Row(
            children: [
              customebutton(
                '+/-',
                switchvalue ? Color(0xff2f3133) : Color(0xffF4F5F7),
              ),
              customebutton(
                '0',
                switchvalue ? Color(0xff2f3133) : Color(0xffF4F5F7),
              ),
              customebutton(
                '00',
                switchvalue ? Color(0xff2f3133) : Color(0xffF4F5F7),
              ),
              customebutton(
                '=',
                Color(0xff8C27DB),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
