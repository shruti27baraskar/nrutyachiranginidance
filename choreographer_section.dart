import 'package:flutter/material.dart';

class ChoreographersPage extends StatelessWidget {
  final List<Map<String, String>> choreographers = [
    {
      "name": "Shruti Deshpandey",
      "image": "assets/images/rohit.jpg",
      "bio": "Expert in Bharatanatyam with 10+ years of experience.",
    },
    {
      "name": "Neha Patil",
      "image": "assets/images/priya.jpg",
      "bio": "Specialist in Lavani and Bollywood fusion dance.",
    },
    {
      "name": "Amit Verma",
      "image": "assets/images/amit.jpg",
      "bio": "Choreographer for Western dance styles and Hip-Hop.",
    },
  ];

  ChoreographersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Our Choreographers")),
      body: ListView.builder(
        itemCount: choreographers.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  choreographers[index]["image"] ?? ('assets/usesr2.png'),
                ),
                radius: 30,
              ),
              title: Text(
                choreographers[index]["name"] ?? "Unknown",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  _showChoreographerDetails(context, choreographers[index]);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF800000), // Maroon color
                  foregroundColor: Colors.white,
                ),
                child: Text("More"),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showChoreographerDetails(
    BuildContext context,
    Map<String, String> choreographer,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    choreographer["image"] ?? 'assets/user2.png',
                  ),
                  radius: 40,
                ),
                SizedBox(height: 10),
                Text(
                  choreographer["name"] ?? "Unknown",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                choreographer["bio"] ?? "No bio available.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: Text("Close"),
              ),
            ],
          ),
    );
  }
}
