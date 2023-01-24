import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_with_bot/injection.dart';
import 'package:talk_with_bot/presentations/provider/chat_controller.dart';
import 'package:talk_with_bot/presentations/question/question_screen.dart';
import 'package:talk_with_bot/presentations/home/home_screen.dart';
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
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuestionController()),
        ChangeNotifierProvider(create: (_) => ChatController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ChatBt",
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
