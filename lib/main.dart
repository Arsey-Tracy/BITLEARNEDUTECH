import 'dart:async';

import 'package:bitlearn/screens/home/chat_interface.dart';
import 'package:flutter/material.dart';

import 'screens/course/courses_page.dart';
import 'screens/quiz/quizes_page.dart';
import 'screens/settings/profile_page.dart';
import 'screens/settings/settings_page.dart';
import 'screens/wallet/wallet_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.orangeAccent, // Background color of the splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Text-based logo
            Text(
              'BitLearn', // Replace with your app name or logo text
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'by Built By Mugaba Ashiraf\n', // Replace with your app name or logo text
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              'ARSEYTECH', // Replace with your app name or logo text
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            // Loading indicator
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of screens for each tab
  final List<Widget> _screens = [
    const HomePage(),
    const CoursePage(),
    const QuizPage(),
    const WalletPage(),
    const SettingPage(),
  ];

  // Handle tab changes
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => _screens[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.orange),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book, color: Colors.orange), label: 'Courses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.task, color: Colors.orange), label: 'Quiz'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet, color: Colors.orange), label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.orange),
              label: 'Setting'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'Bitlearn',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              // handle profile button click
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course overview section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Course Overview',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 500,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Progress: 70%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Keep up the good work!',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Active Courses',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Use ListView inside a constrained container
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(
                      Icons.book,
                      color: Colors.blueAccent,
                    ),
                    title: Text('Course Title ${index + 1}'),
                    subtitle: Text('Course Progress: ${(index + 1) * 20}%'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            // Additional list of tasks
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3, // Set the number of tasks you want to display
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.check_box, color: Colors.green),
                    title: Text('Task ${index + 1}'),
                    subtitle: const Text('Due: Tomorrow'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Handle task tap
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatInterface()),
          );
        },
        child: Icon(Icons.chat),
      ),
    );
  }
}
