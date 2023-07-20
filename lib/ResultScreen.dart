// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'CounterClass.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key? key, required this.corrects, required this.wrongs, required this.counter }) : super(key: key);

  int corrects;
  int wrongs;
  Counter counter = Counter();

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a374d),
      appBar: AppBar(
        title: const Text(
          "Result",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Correct Answers = ${widget.corrects}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 255, 106),
                shadows: [
                  Shadow(
                    color: Colors.black, 
                    blurRadius: 1.0,
                    offset: Offset(2, 2), 
                  ),
                ]
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Wrong Answers = ${widget.wrongs}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 255, 17, 0),
                shadows: [
                  Shadow(
                    color: Colors.black, 
                    blurRadius: 1.0,
                    offset: Offset(2, 2), 
                  ),
                ]
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
              'Reset',
              style: TextStyle(fontSize: 25)
              ),
              onPressed: (){
                setState(() {
                  widget.counter.reset();
                  widget.corrects = widget.counter.correctAnswer;
                  widget.wrongs = widget.counter.wrongAnswer;
                });
              }, 
            ),
          ],
        ),
      ),
    );
  }
}