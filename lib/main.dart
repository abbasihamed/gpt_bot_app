import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_with_bot/injection.dart';
import 'package:talk_with_bot/presentations/chat/chat_screen.dart';
import 'package:talk_with_bot/presentations/provider/question_controller.dart';
import 'package:talk_with_bot/utils/app_theme.dart';
import 'package:talk_with_bot/utils/get_certification.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  HttpOverrides.global = MyHttpOverrides();
  runApp(DevicePreview(
    enabled: false,
    builder: (context) {
      return const MyApp();
    }
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuestionController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ChatBt",
        theme: AppTheme.lightTheme,
        home: const ChatScreen(),
      ),
    );
  }
}
