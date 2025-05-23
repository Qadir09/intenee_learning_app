import 'package:flutter/material.dart';

class QuizProgressPage extends StatelessWidget {
  final int totalQuizzes = 8;
  final int completedQuizzes = 1; // Ideally, this would come from user data

  @override
  Widget build(BuildContext context) {
    int remainingQuizzes = totalQuizzes - completedQuizzes;
    double progress = completedQuizzes / totalQuizzes;

    return Scaffold(
      appBar: AppBar(
        title: const Text("📈 Quiz Progress Tracker"),
        backgroundColor: Colors.green.shade800,
      ),
      backgroundColor: Colors.green.shade50,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.green.shade100,
              color: Colors.green.shade700,
              minHeight: 10,
            ),
            const SizedBox(height: 10),
            Text(
              "$completedQuizzes of $totalQuizzes quizzes completed",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            _infoCard(
              "Completed Quizzes",
              completedQuizzes.toString(),
              Icons.check_circle,
              Colors.green,
            ),
            const SizedBox(height: 10),
            _infoCard(
              "Remaining Quizzes",
              remainingQuizzes.toString(),
              Icons.pending_actions,
              Colors.orange,
            ),
            const SizedBox(height: 10),
            _infoCard("Total Quiz Score", "84%", Icons.score, Colors.blue),
            const SizedBox(height: 10),
            _infoCard(
              "Avg Time per Quiz",
              "0m 32s",
              Icons.timer,
              Colors.purple,
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.quiz),
                label: const Text("Start New Quiz"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value, IconData icon, Color iconColor) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: iconColor, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
