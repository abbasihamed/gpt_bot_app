import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:talk_with_bot/injection.dart';
import 'package:talk_with_bot/presentations/chat/chat_screen.dart';
import 'package:talk_with_bot/presentations/question/question_screen.dart';
import 'package:talk_with_bot/presentations/components/home_items.dart';
import 'package:talk_with_bot/utils/app_theme.dart';
import 'package:talk_with_bot/utils/internet_connetcion.dart';
import 'package:talk_with_bot/utils/theme.dart';
import 'package:talk_with_bot/utils/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getIt.get<InternetConnection>().checker();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bot'),
        leading: ThemeSwitcher.withTheme(
          builder: (context, switcher, theme) {
            return IconButton(
              onPressed: () {
                switcher.changeTheme(
                  theme: theme.brightness == Brightness.light
                      ? AppTheme.darkTheme
                      : AppTheme.lightTheme,
                );
                getIt.get<ThemeController>().setTheme(theme.brightness);
              },
              icon: theme.brightness == Brightness.light
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: theme(context).colorScheme.onSecondary,
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
