import 'package:flutter/material.dart';

class UniversitySelectionPage extends StatefulWidget {
  @override
  _UniversitySelectionPageState createState() =>
      _UniversitySelectionPageState();
}

class _UniversitySelectionPageState extends State<UniversitySelectionPage> {
  late String selectedUniversity;
  late String selectedCourse;

  List<String> universities = [
    'University of Cape',
    'University of Pretoria',
    'University of Phonix'
  ];
  List<String> courses = ['Computer science', 'Accounting', 'Art'];

  @override
  void initState() {
    super.initState();
    // Initialize selectedUniversity and selectedCourse with the first items in their respective lists
    selectedUniversity = universities.first;
    selectedCourse = courses.first;
  }

  void submit() {
    // Return selected university and course to the previous screen
    Navigator.pop(context, '$selectedUniversity - $selectedCourse');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: selectedUniversity,
              hint: Text('Select University'),
              items: universities
                  .map((university) => DropdownMenuItem<String>(
                        value: university,
                        child: Text(university),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedUniversity = value!;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedCourse,
              hint: Text('Select Course'),
              items: courses
                  .map((course) => DropdownMenuItem<String>(
                        value: course,
                        child: Text(course),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCourse = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
