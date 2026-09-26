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
        brightness: Brightness.dark,
      ),
      home: const ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController controller = TextEditingController();

  final List<Map<String, String>> messages = [
    {
      'sender': 'buddy',
      'text': 'Hi! I’m your Homework Buddy 👋\nWhat are we studying today?'
    },
  ];

  void sendMessage() {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({
        'sender': 'user',
        'text': text,
      });
    });

    controller.clear();

    // Temporary response until we connect the AI.
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;

      setState(() {
        messages.add({
          'sender': 'buddy',
          'text': 'Got it! I’ll help you with that. 🤓'
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              child: Icon(Icons.school_rounded),
            ),
            SizedBox(width: 12),
            Text('Homework Buddy'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message['sender'] == 'user';

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 320),
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isUser
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      message['text']!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 6, 10, 10),
              child: Row(
                children: [
                  IconButton(
                    tooltip: 'Take a homework photo',
                    icon: const Icon(Icons.camera_alt_rounded),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => sendMessage(),
                      decoration: InputDecoration(
                        hintText: 'Ask your homework buddy...',
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  IconButton(
                    tooltip: 'Voice input',
                    icon: const Icon(Icons.mic_rounded),
                    onPressed: () {},
                  ),
                  IconButton(
                    tooltip: 'Send',
                    icon: const Icon(Icons.send_rounded),
                    onPressed: sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
