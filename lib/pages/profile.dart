import 'package:flutter/material.dart';

class StudentProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Profile'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: buildProfileInfoSection(),
          ),
          Expanded(
            flex: 7,
            child: buildAchievementsSection(),
          ),
        ],
      ),
    );
  }

  Widget buildProfileInfoSection() {
    return Container(
      color: Colors.blueGrey[100], // Example background color
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile picture
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(
                  "images/john.jpg"), // Replace with actual image URL
            ),
            SizedBox(height: 8.0),
            // Student name (larger font)
            Text(
              'John Doe',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            // Year/Program
            Text('Year 3 - Computer Science'),
            SizedBox(height: 8.0),
            // Social media links (optional)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () {}, // Add navigation logic
                ),
                IconButton(
                  icon: Icon(Icons.alternate_email),
                  onPressed: () {}, // Add navigation logic
                ),
              ],
            ),
            SizedBox(height: 8.0),
            // Bio
            Text(
              'A passionate computer science student interested in AI and mobile development.',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAchievementsSection() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section titles
          Text('Academics',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 8.0),
          Text('Extracurriculars',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 8.0),
          // ... Add similar sections for Skills and Projects with content
        ],
      ),
    );
  }
}
