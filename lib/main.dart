import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_with_bot/injection.dart';
import 'package:talk_with_bot/presentations/provider/chat_controller.dart';
import 'package:talk_with_bot/presentations/home/home_screen.dart';
import 'package:talk_with_bot/presentations/provider/question_controller.dart';
import 'package:talk_with_bot/utils/const.dart';
import 'package:talk_with_bot/utils/get_certification.dart';
import 'package:talk_with_bot/utils/theme_controller.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  final theme = await getIt.get<ThemeController>().getTheme();
  print(theme);
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return MyApp(
          initTheme: theme,
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  final ThemeData initTheme;
  const MyApp({
    super.key,
    required this.initTheme,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuestionController()),
        ChangeNotifierProvider(create: (_) => ChatController()),
      ],
      child: ThemeProvider(
          initTheme: initTheme,
          builder: (context, theme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              scaffoldMessengerKey: snackBar,
              title: "ChatBt",
              theme: theme,
              home: const HomeScreen(),
            );
          }),
    );
  }
}
