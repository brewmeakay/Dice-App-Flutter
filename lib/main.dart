import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: const Text(
          'Dicey',
        ),
      ),
      body: const DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  List<int> listOfNumbers = [1, 2, 3, 4, 5, 6];

  int leftDiceNumber = 3;

  int rightDiceNumber = 5;

  int getRandomElement(List list) {
    final random = Random();
    int choosenNumber = random.nextInt(list.length);
    return list[choosenNumber];
  }

  void changeLeftDice() {
    leftDiceNumber = getRandomElement(listOfNumbers);
  }

  void changeRightDice() {
    rightDiceNumber = getRandomElement(listOfNumbers);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //left dice
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    //write something here
                    setState(() {
                      changeLeftDice();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                  ),
                ),
              ),
              //right dice
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    //write something here
                    setState(() {
                      changeRightDice();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: IconButton(
            iconSize: 60.0,
            onPressed: () {
              setState(() {
                changeLeftDice();
                changeRightDice();
              });
            },
            icon: const Icon(
              Icons.track_changes,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
