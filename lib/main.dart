import 'package:flashcards/flashcard.dart';
import 'package:flashcards/flashcard_view.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Flashcard> _flashcards = [
    Flashcard(
      question: "What programming language does Flutter use?",
      answer: "Dart"
    ),
    Flashcard(
        question: "Who you gonna call?",
        answer: "Ghostbusters!"
    ),
    Flashcard(
        question: "What is your name?",
        answer: "Dani"
    ),

  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  front: FlashcardView(
                    text: _flashcards[_currentIndex].question,
                  ),
                  back: FlashcardView(
                    text: _flashcards[_currentIndex].answer,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: showPreviousCard,
                    icon: Icon(Icons.chevron_left),
                    label: Text('Prev'),
                  ),
                  OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text('Next'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex = _currentIndex < _flashcards.length - 1 ? _currentIndex + 1 : 0;
    });

  }

  void showPreviousCard() {
    setState(() {
      _currentIndex = _currentIndex > 0 ? _currentIndex - 1 : _flashcards.length - 1;
    });

  }
}
