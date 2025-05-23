import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0;
  int current = 0;

  final List<Map<String, dynamic>> questions = [
    {
      "q": "What is Flutter?",
      "a": ["SDK", "IDE", "OS"],
      "correct": 0,
    },
    {
      "q": "Who developed Dart?",
      "a": ["Apple", "Google", "Facebook"],
      "correct": 1,
    },
    {
      "q": "Which language is used in Flutter?",
      "a": ["Java", "Kotlin", "Dart"],
      "correct": 2,
    },
    {
      "q": "What widget is used for layout in Flutter?",
      "a": ["Column", "TextField", "SnackBar"],
      "correct": 0,
    },
    {
      "q": "Which company developed Flutter?",
      "a": ["Facebook", "Google", "Amazon"],
      "correct": 1,
    },
    {
      "q": "What does ‘StatelessWidget’ mean?",
      "a": ["No UI", "Immutable UI", "Mutable UI"],
      "correct": 1,
    },
    {
      "q": "Which widget is used for scrolling?",
      "a": ["Row", "ListView", "Text"],
      "correct": 1,
    },
    {
      "q": "What is ‘hot reload’?",
      "a": ["App restart", "UI preview", "Code refresh without restart"],
      "correct": 2,
    },
    {
      "q": "Which one is a valid Flutter widget?",
      "a": ["Scaffold", "Container", "Both"],
      "correct": 2,
    },
    {
      "q": "Which plugin is used for Firebase Auth?",
      "a": ["firebase_core", "firebase_auth", "cloud_firestore"],
      "correct": 1,
    },
    {
      "q": "Flutter is mainly used for?",
      "a": ["Mobile Apps", "Websites", "Databases"],
      "correct": 0,
    },
    {
      "q": "Dart is what type of language?",
      "a": ["Object Oriented", "Functional", "Procedural"],
      "correct": 0,
    },
  ];

  void checkAnswer(int index) {
    if (index == questions[current]['correct']) score++;

    if (current < questions.length - 1) {
      setState(() {
        current++;
      });
    } else {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text("🎉 Quiz Completed"),
              content: Text("Your Score: $score / ${questions.length}"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // close dialog
                    Navigator.pop(context); // go back
                  },
                  child: const Text("Finish"),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[current];

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("📚 Flutter Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (current + 1) / questions.length,
              backgroundColor: Colors.green.shade100,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Q${current + 1}: ${question['q']}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ...List.generate(
              question['a'].length,
              (i) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  onPressed: () => checkAnswer(i),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text(
                    question['a'][i],
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
