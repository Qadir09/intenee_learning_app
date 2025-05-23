import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text('About Internee.pk'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                "assets/images/internee_logo.png",
              ), // Add logo to assets
            ),
            const SizedBox(height: 20),
            const Text(
              "Internee.pk",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Bridging the gap between fresh talent and the software industry through virtual internships in Pakistan.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
            ),
            const SizedBox(height: 30),

            // Mission Card
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    Text(
                      "🚀 Our Mission",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "To empower students and fresh graduates with real-world tech experience through remote internships and live projects.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Contact Info Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.location_on,
                        color: Colors.green,
                      ),
                      title: const Text("Lahore, Pakistan"),
                    ),
                    ListTile(
                      leading: const Icon(Icons.email, color: Colors.green),
                      title: const Text("info@internee.pk"),
                    ),
                    ListTile(
                      leading: const Icon(Icons.link, color: Colors.green),
                      title: GestureDetector(
                        onTap: () => _launchUrl("https://internee.pk"),
                        child: const Text(
                          "https://internee.pk",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Social Media Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.green,
                  ),
                  onPressed:
                      () => _launchUrl("https://facebook.com/internee.pk"),
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.green,
                  ),
                  onPressed:
                      () => _launchUrl(
                        "https://linkedin.com/company/internee-pk",
                      ),
                ),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.green,
                  ),
                  onPressed:
                      () => _launchUrl("https://instagram.com/internee.pk"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
