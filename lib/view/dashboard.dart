import 'package:flutter/material.dart';
import 'package:intenee_learning_app/module/course.dart';
import 'package:intenee_learning_app/quiz_screen.dart';
import 'package:intenee_learning_app/view/about_page.dart';
import 'package:intenee_learning_app/view/quizetracking.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp(home: MyHomePage(title: 'Internee LMS App')));

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Course> courses = [
    Course(
      name: 'Graphics Desgining',
      instructorName: 'Myra Rafique',
      duration: '45 Minute',
      complexity: 'Beginner',
      picture: 'assets/images/flutterLogo.jpg',
      link:
          'https://learn.internee.pk/home/course/graphic-designing-using-adobe-illustrator/33',
    ),
    Course(
      name: 'Intermediate flutter course',
      instructorName: 'Maria',
      duration: '1.5 Hour',
      complexity: 'Beginner',
      picture: 'assets/images/flutterLogo.jpg',
      link: 'https://learn.internee.pk/home/course/flutter-complete-course/35',
    ),
    Course(
      name: 'Intermediate Python',
      instructorName: 'Asmaa Nadeem',
      duration: '1.5 Hour',
      complexity: 'Beginner',
      picture: 'assets/images/flutterLogo.jpg',
      link: 'https://learn.internee.pk/home/course/python-full-course/39',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Internee LMS'),
        backgroundColor: Colors.green,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.white70),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            ListTile(
              title: const Text(
                'Tracking Result',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizProgressPage()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'About Us',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: courses.length,
        padding: EdgeInsets.all(20),
        separatorBuilder: (context, index) {
          return Divider(thickness: 2, color: Colors.black);
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle tap action here
              _launchUrl(courses[index].link!);
            },
            child: Column(
              children: [
                Image.asset(courses[index].picture!, width: 350, height: 350),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courses[index].name!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          courses[index].instructorName!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Duration: ' + courses[index].duration!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Level: ' + courses[index].complexity!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        label: const Text(
          'Take Quiz',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.quiz, color: Colors.green),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => QuizPage()),
          );
        },
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await canLaunch(url)) {
      throw Exception('Could not launch $url');
    } else {
      await launch(url);
    }
  }
}
