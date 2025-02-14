import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _allCourses = [
    "Flutter for Beginners",
    "Advanced Dart",
    "React Native Fundamentals",
    "JavaScript Essentials",
    "Python Data Science",
    "Full Stack Development",
    "Machine Learning Basics"
  ];

  List<String> _filteredCourses = [];

  @override
  void initState() {
    super.initState();
    _filteredCourses = _allCourses; // Initially show all courses
  }

  void _filterCourses(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _filteredCourses = _allCourses
            .where(
                (course) => course.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        _filteredCourses = _allCourses;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Courses'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _filterCourses,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _filteredCourses.isNotEmpty
                  ? ListView.builder(
                      itemCount: _filteredCourses.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            title: Text(_filteredCourses[index]),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'No courses found.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
