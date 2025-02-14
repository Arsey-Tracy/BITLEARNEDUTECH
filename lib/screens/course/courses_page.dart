import 'package:bitlearn/screens/search/search_screen.dart';
import 'package:flutter/material.dart';

import 'course_card.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'Courses',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 3, // Assuming 3 courses for now
          itemBuilder: (context, index) {
            return CourseCard(
              image:
                  'https://picsum.photos/300', // Replace with course image URL
              title: 'Course Title ${index + 1}',
              description: 'This is the description of Course ${index + 1}.',
            );
          },
        ),
      ),
    );
  }
}
