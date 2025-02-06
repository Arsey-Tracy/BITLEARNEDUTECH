import 'dart:async';

import 'package:flutter/material.dart';

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
        backgroundColor: Colors.blue,
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

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Replace with actual user profile image URL
            ),
            const SizedBox(height: 16),
            const Text(
              'Username',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'email@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            const Text(
              'About Me',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'This is a brief description about the user. You can display more details here.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Handle log out or other profile actions
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}

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

class ChatInterface extends StatefulWidget {
  const ChatInterface({super.key});

  @override
  _ChatInterfaceState createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];

  void sendMessage() async {
    final userMessage = _controller.text;
    if (userMessage.isEmpty) return;

    setState(() {
      messages.add({'sender': 'user', 'message': userMessage});
    });

    _controller.clear();

    // Simulate an AI response
    final aiResponse = await getAIResponse(userMessage);
    setState(() {
      messages.add({'sender': 'assistant', 'message': aiResponse});
    });
  }

  Future<String> getAIResponse(String message) async {
    // This function simulates an AI response.
    // Replace this with an actual API call to an AI assistant, e.g., OpenAI or Dialogflow.
    await Future.delayed(Duration(seconds: 1));
    return "AI Assistant's response to: $message";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat with Assistant')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUserMessage = message['sender'] == 'user';
                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                      color: isUserMessage ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      message['message']!,
                      style: TextStyle(
                          color: isUserMessage ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const CourseCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuizCompletionPage extends StatelessWidget {
  const QuizCompletionPage({super.key});
  void _rewardUser(BuildContext context) {
    //Reward amount (e.g., 0.001 BTC)
    double rewardAmount = 0.001;

    // Update the wallet
    // WalletBalance.value += rewardAmount;

    // show confirmation dialogue
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Quiz Completed!"),
              content: Text("You've been rewarded with $rewardAmount BTC!"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // close dilogue
                  },
                  child: const Text("OK"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Quiz'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _rewardUser(context);
          },
          child: const Text('Complete Quiz and Earn'),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Hardcoded list of quizzes with questions and answers
  final List<Map<String, dynamic>> quizzes = [
    {
      'title': 'Flutter Basics',
      'questions': [
        {
          'question': 'What is Flutter?',
          'options': [
            'A mobile development framework',
            'A database',
            'A programming language',
            'A web browser'
          ],
          'answer': 'A mobile development framework'
        },
        {
          'question': 'Which language is used to write Flutter apps?',
          'options': ['Python', 'Dart', 'JavaScript', 'C++'],
          'answer': 'Dart'
        },
      ]
    },
    {
      'title': 'Dart Programming',
      'questions': [
        {
          'question': 'What is Dart mainly used for?',
          'options': [
            'Backend development',
            'Mobile development',
            'Game development',
            'Database management'
          ],
          'answer': 'Mobile development'
        },
        {
          'question': 'Which company created Dart?',
          'options': ['Facebook', 'Google', 'Microsoft', 'Apple'],
          'answer': 'Google'
        },
      ]
    }
  ];

  int _currentQuizIndex = 0; // Tracks the current quiz index
  int _currentQuestionIndex = 0; // Tracks the current question index
  String? _selectedOption; // Stores the selected answer

  // Handle answer selection
  void _selectOption(String option) {
    setState(() {
      _selectedOption = option;
    });
  }

  // Handle question navigation and quiz completion
  void _nextQuestion() {
    final currentQuiz = quizzes[_currentQuizIndex];
    final currentQuestion = currentQuiz['questions'][_currentQuestionIndex];

    if (_selectedOption == currentQuestion['answer']) {
      // Correct answer
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Correct!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // Incorrect answer
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect!'),
          backgroundColor: Colors.red,
        ),
      );
    }

    // Move to the next question or quiz
    setState(() {
      if (_currentQuestionIndex < currentQuiz['questions'].length - 1) {
        _currentQuestionIndex++;
      } else if (_currentQuizIndex < quizzes.length - 1) {
        _currentQuizIndex++;
        _currentQuestionIndex = 0;
      } else {
        // Reset everything when all quizzes are done
        _currentQuizIndex = 0;
        _currentQuestionIndex = 0;
      }
      _selectedOption = null; // Reset selected option for the next question
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuiz = quizzes[_currentQuizIndex];
    final currentQuestion = currentQuiz['questions'][_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz: ${currentQuiz['title']}'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display question
            Text(
              'Question ${_currentQuestionIndex + 1}/${currentQuiz['questions'].length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              currentQuestion['question'],
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),

            // Display options
            Column(
              children: currentQuestion['options'].map<Widget>((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    _selectOption(value!);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Next button
            ElevatedButton(
              onPressed: _selectedOption == null
                  ? null
                  : () {
                      _nextQuestion();
                    },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

// Wallet balance notifier
// ignore: non_constant_identifier_names
// ValueNotifier<double> WalletBalance = ValueNotifier(0.025);

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'Wallet',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wallet Overview Section
            const Text(
              'Wallet Overview',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              // ignore: prefer_const_constructors
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Bitcoin Balance',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '0.025 BTC',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Approximate Value: \$750',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Redeem Section
            const Text(
              'Redeem Bitcoin',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone_android, color: Colors.green),
                title: const Text('Cashout to Airtime'),
                subtitle: const Text('Top up your airtime with Bitcoin.'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // Handle redeem to airtime
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.data_usage, color: Colors.blue),
                title: const Text('Cashout to Data'),
                subtitle: const Text('Buy data with your Bitcoin balance.'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // Handle redeem to data
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.money, color: Colors.orange),
                title: const Text('Cashout to Cash'),
                subtitle: const Text(
                    'Withdraw Bitcoin to your bank or mobile money.'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // Handle cashout to cash
                },
              ),
            ),
            const SizedBox(height: 30),

            // Transaction History Section
            const Text(
              'Transaction History',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3, // Sample transaction count
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.history, color: Colors.blue),
                    title: Text('Transaction #${index + 1}'),
                    subtitle: Text('Completed on 2024-10-2${index + 1}'),
                    trailing: const Text('\$250'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Account Settings Section
          const Text(
            'Account Settings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Edit Profile'),
            onTap: () {
              // Handle edit profile action
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            onTap: () {
              // Handle change password action
            },
          ),
          const Divider(),

          // Notifications Section
          const Text(
            'Notifications',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SwitchListTile(
            title: const Text('Receive Notifications'),
            value: true, // This can be managed via state in StatefulWidget
            onChanged: (bool value) {
              // Handle notifications toggle
            },
          ),
          const Divider(),

          // Other Settings Section
          const Text(
            'Other Settings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            subtitle: const Text('English'),
            onTap: () {
              // Handle language change
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              // Handle about section
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}
