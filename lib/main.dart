import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '✊';
  String computerHand = '✊';
  String result = '引き分け';

  void selectHand(String selectedHand) {
    myHand = selectedHand;
    generateComputerHand();
    //sleep(Duration(milliseconds: 150));

    judge();
    setState(() {});
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
    print(randomNumberToHand(randomNumber));
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌️';
      case 2:
        return '✋';
      default:
        return '✊';
    }
  }

  void judge() {
    // if (computerHand == myHand) {
    //   result = '引き分け';
    // } else if (myHand == '✊' && computerHand == '✌️') {
    //   result = '勝ち';
    // } else if (myHand == '✌️' && computerHand == '✋') {
    //   result = '勝ち';
    // } else if (myHand == '✋' && computerHand == '✊') {
    //   result = '勝ち';
    // }

    if (computerHand == myHand) {
      result = '引き分け';
    } else if (myHand == '✊' && computerHand == '✌️' ||
        myHand == '✌️' && computerHand == '✋' ||
        myHand == '✋' && computerHand == '✊') {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result,
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            computerHand,
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: 64,
          ),
          Text(
            myHand,
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  selectHand('✊');
                  // myHand = '✊';
                  // print('✊');
                  // setState(() {});
                },
                child: Text('✊'),
              ),
              ElevatedButton(
                onPressed: () {
                  selectHand('✌️');
                  // myHand = '✌️';
                  // print('✌️');
                  // setState(() {});
                },
                child: Text('✌️'),
              ),
              ElevatedButton(
                onPressed: () {
                  selectHand('✋');
                  // myHand = '✋';
                  // print('✋');
                  // setState(() {});
                },
                child: Text('✋'),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
