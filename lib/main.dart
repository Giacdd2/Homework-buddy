import 'package:flutter/material.dart';

void main() {
  runApp(const HomeworkBuddyApp());
}

class HomeworkBuddyApp extends StatelessWidget {
  const HomeworkBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homework Buddy',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homework Buddy'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.school_rounded,
                size: 80,
              ),
              const SizedBox(height: 24),
              const Text(
                'Hi! I’m your Homework Buddy.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Ask me about your homework, take a photo of a problem, or study with me.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.chat_rounded),
                label: const Text('Start Chatting'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
