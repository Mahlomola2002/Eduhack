// ignore_for_file: prefer_const_constructors, unused_element, use_key_in_widget_constructors, no_logic_in_create_state, library_private_types_in_public_api
import 'package:flutter/material.dart';

class UniversityNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University News'),
        backgroundColor: Colors.teal, // Apply primary color
      ),
      body: ListView.builder(
        itemCount: universityNewsList.length,
        itemBuilder: (context, index) {
          return UniversityNewsCard(news: universityNewsList[index]);
        },
      ),
    );
  }
}

class UniversityNewsCard extends StatelessWidget {
  final UniversityNews news;

  UniversityNewsCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(12.0), // Increased padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // Added row for image and title
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Add logic to display an image here (consider using CachedNetworkImage package)
                Container(
                  width: 80.0,
                  height: 60.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Placeholder(
                      // Placeholder for image
                      child: Text('Image'),
                    ),
                  ),
                ),
                Flexible(
                  // Flexible widget for title to wrap on smaller screens
                  child: Text(
                    news.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              news.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Row(
              // Added row for source with emphasis
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Source:',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                Text(
                  news.source,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UniversityNews {
  final String title;
  final String description;
  final String source;

  UniversityNews({
    required this.title,
    required this.description,
    required this.source,
  });
}

List<UniversityNews> universityNewsList = [
  UniversityNews(
    title: 'New Computer Science Program Introduced at XYZ University',
    description:
        'XYZ University announces the launch of its new Computer Science degree program focusing on AI and Machine Learning.',
    source: 'ABC News',
  ),
  UniversityNews(
    title: 'Scholarship Opportunities for Engineering Students',
    description:
        'Several scholarships are now available for undergraduate engineering students at ABC University. Apply now!',
    source: 'Engineering Today',
  ),
  UniversityNews(
    title: 'Applications Open for MBA Program at PQR University',
    description:
        'PQR University invites applications for its prestigious MBA program. Apply before the deadline!',
    source: 'MBA Insight',
  ),
  UniversityNews(
    title: 'New Scholarship Program for Underrepresented Students',
    description:
        'DEF University launches a scholarship program aimed at supporting underrepresented students pursuing STEM degrees.',
    source: 'Education Times',
  ),
  UniversityNews(
    title: 'New Computer Science Program Introduced at XYZ University',
    description:
        'XYZ University announces the launch of its new Computer Science degree program focusing on AI and Machine Learning.',
    source: 'ABC News',
  ),
  UniversityNews(
    title: 'Scholarship Opportunities for Engineering Students',
    description:
        'Several scholarships are now available for undergraduate engineering students at ABC University. Apply now!',
    source: 'Engineering Today',
  ),
  UniversityNews(
    title: 'Applications Open for MBA Program at PQR University',
    description:
        'PQR University invites applications for its prestigious MBA program. Apply before the deadline!',
    source: 'MBA Insight',
  ),
  UniversityNews(
    title: 'New Scholarship Program for Underrepresented Students',
    description:
        'DEF University launches a scholarship program aimed at supporting underrepresented students pursuing STEM degrees.',
    source: 'Education Times',
  ),
  UniversityNews(
    title: 'University of Cape Town Ranks Among Top 200 Universities Globally',
    description:
        'The University of Cape Town (UCT) has been ranked among the top 200 universities worldwide in the latest QS World University Rankings.',
    source: 'UCT News',
  ),
  UniversityNews(
    title: 'UCT Receives Grant for Research in Renewable Energy',
    description:
        'UCT has received a substantial grant for research in renewable energy, furthering its commitment to sustainable development.',
    source: 'Renewable Energy Journal',
  ),
];
