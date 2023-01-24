import 'package:flutter/material.dart';
import 'package:talk_with_bot/presentations/chat/chat_screen.dart';
import 'package:talk_with_bot/presentations/question/question_screen.dart';
import 'package:talk_with_bot/presentations/components/home_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bot'),
        leading: const Icon(
          Icons.light_mode,
          color: Colors.yellow,
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.amber[200],
            child: const Text(
              'No history will be saved',
              style: TextStyle(wordSpacing: 1.2),
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeItems(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuestionScreen(),
                          ),
                        );
                      },
                      colors: const [
                        Colors.red,
                        Colors.orange,
                      ],
                      itemName: r'Q&A',
                    ),
                    HomeItems(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatScreen(),
                          ),
                        );
                      },
                      colors: const [
                        Colors.blue,
                        Colors.purple,
                      ],
                      itemName: 'Chat',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
