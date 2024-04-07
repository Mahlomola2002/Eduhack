// ignore_for_file: prefer_const_constructors, unused_element, use_key_in_widget_constructors, no_logic_in_create_state, library_private_types_in_public_api
import 'package:app/pages/messageUI.dart';
import 'package:flutter/material.dart';

class Mentor {
  final String name;
  final String expertise;
  final String image;

  Mentor(this.name, this.expertise, this.image);
}

class QA {
  final String question;
  final String answer;

  QA(this.question, this.answer);
}

class BroadcastChannelPage extends StatefulWidget {
  final String selectedUniversity;
  final String selectedCourse;

  BroadcastChannelPage({
    required this.selectedUniversity,
    required this.selectedCourse,
  });

  @override
  _BroadcastChannelPageState createState() => _BroadcastChannelPageState();
}

class _BroadcastChannelPageState extends State<BroadcastChannelPage> {
  late List<QA> filteredQuestionsAndAnswers;
  final List<QA> questionsAndAnswers = [
    QA("What programming languages should I learn before entering university??",
        "It's good to have a strong foundation in languages like Python, Java, or C++ as they're commonly used in university courses."),
    QA("Are there any specific math topics I should focus on before starting university??",
        "Yes, focusing on algebra, calculus, and discrete mathematics will be beneficial as they form the basis of many computer science concepts."),
    QA("How can I prepare for university-level computer science courses during high school?",
        "You can start by working on personal coding projects, participating in programming competitions, and taking online courses or tutorials in computer science topics."),
    QA("What kind of projects or extracurricular activities would enhance my university application for computer science?",
        " Creating your own apps or websites, participating in coding competitions, contributing to open-source projects, or joining a robotics or computer science club would all be beneficial."),
    QA("What should I expect from the computer science curriculum at university?",
        "You'll likely cover a range of topics including algorithms, data structures, programming languages, software engineering, computer architecture, and more."),
    QA("How can I effectively manage my time and workload in university?",
        "Developing good time management skills, breaking tasks into smaller chunks, and prioritizing assignments based on deadlines are important strategies."),
    QA("What opportunities are there for internships or co-op programs in computer science?",
        "Many universities offer internship or co-op programs where you can gain practical experience working in the industry during your studies."),
    QA("What resources are available for students who need extra help with their coursework?",
        "Most universities offer tutoring services, study groups, and office hours with professors or teaching assistants to provide additional support."),
    QA("What are some potential career paths for computer science graduates?",
        " Computer science graduates can work in a variety of industries including software development, cybersecurity, artificial intelligence, data science, and more.")
  ];

  @override
  void initState() {
    super.initState();
    filteredQuestionsAndAnswers = questionsAndAnswers;
  }

  void filterQuestionsAndAnswers(String keyword) {
    setState(() {
      filteredQuestionsAndAnswers = questionsAndAnswers
          .where(
            (qa) => qa.question.toLowerCase().contains(keyword.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 185, 187),
      appBar: AppBar(
        title: Text('${widget.selectedCourse} Channel'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to online mentors page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OnlineMentorsPage(
                    course: widget.selectedCourse,
                  ),
                ),
              );
            },
            icon: Icon(Icons.people),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        onChanged: filterQuestionsAndAnswers,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 15, 15, 15),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Implement your search functionality here
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredQuestionsAndAnswers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredQuestionsAndAnswers[index].question),
                  subtitle: Text(
                      'Answer: ${filteredQuestionsAndAnswers[index].answer}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OnlineMentorsPage extends StatelessWidget {
  final String course;

  final List<Mentor> onlineMentors = [
    Mentor("John Doe", "Expert in ", "images/john.jpg"),
    Mentor("Jane Smith", "Expert in ", "images/smith.jpg"),
    // Add more online mentors as needed
  ];
  OnlineMentorsPage({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Mentors'),
      ),
      body: ListView.builder(
        itemCount: onlineMentors.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(onlineMentors[index].image),
            ),
            title: Text(onlineMentors[index].name),
            subtitle: Text('${onlineMentors[index].expertise} $course'),
            onTap: () {
              // Navigate to messaging UI when mentor is selected
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
