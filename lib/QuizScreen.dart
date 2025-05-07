// ignore_for_file: file_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'ResultScreen.dart';
import 'CounterClass.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Counter counter = Counter();
  List<String> countries = [
    "Oman",
    "Palestine",
    "Qatar",
    "Negiria",
    "India",
    "China",
    "Ghana",
    "Indonesia",
    "Spain",
    "France",
    "Germany",
    "Ireland",
    "Italy",
    "Egypt",
    "Algeria",
    "Poland",
    "Russia",
    "UAE",
    "UK",
    "US",
  ];

  int num = Random().nextInt(3);   //to give random number less than 3

  @override
  void initState() {
    //used to show the first state of the app
    super.initState();
    countries.shuffle(); //in this case we want the flags to start randomly
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      //backgroundColor: const Color(0xFF1a374d),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: height * 0.05),
              const Text(
                "Guess the flag?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: height * 0.01),
              Text(
                countries[num],         //we use num to give a random number from the index
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: height * 0.05),
              for (int pic = 0; pic < 3; pic++)
                FlagButton(             //check the class below
                  flag: countries[pic],
                  onPressed: () {
                    if (pic == num) {
                      counter.incrementCo();
                      Fluttertoast.showToast(
                        msg: 'Correct',
                        backgroundColor: Colors.green[600],
                        fontSize: 20,
                      );
                      setState(() {
                        countries.shuffle();
                        num = Random().nextInt(3);
                      });
                    } 
                    else {
                      counter.incrementWr();
                      Fluttertoast.showToast(
                        msg: 'Wrong',
                        backgroundColor: Colors.red[600],
                        fontSize: 20,
                      );
                    }
                  },
                ),
              SizedBox(height: height * 0.05),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ResultScreen(
                        //we have to pass data to the result screen
                        corrects: counter.correctAnswer,
                        wrongs: counter.wrongAnswer,
                        counter: counter,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Result',
                  style: TextStyle(fontSize: 20, color: Colors.teal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FlagButton extends StatelessWidget {
  const FlagButton({
    Key? key,
    required this.flag,
    required this.onPressed,
  }) : super(key: key);

  final String flag;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            width: width * 0.35,
            height: height * 0.15,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("asset/countries/$flag.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
