import 'package:flutter/material.dart';

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
