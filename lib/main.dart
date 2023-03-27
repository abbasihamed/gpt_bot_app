import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_with_bot/data/local/hive_storage_imp.dart';
import 'package:talk_with_bot/injection.dart';
import 'package:talk_with_bot/presentations/logic/api_key_controller.dart';
import 'package:talk_with_bot/presentations/logic/chat_controller.dart';
import 'package:talk_with_bot/presentations/screens/home_screen.dart';
import 'package:talk_with_bot/presentations/logic/theme_controller.dart';
import 'package:talk_with_bot/utils/const.dart';
import 'package:talk_with_bot/utils/get_certification.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  HttpOverrides.global = MyHttpOverrides();
  await getIt.get<HiveStorageImp>().initDb();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = getIt.get<ThemeDataController>().getData();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatController()),
        ChangeNotifierProvider(create: (_) => KeyController()),
      ],
      child: ThemeProvider(
        initTheme: theme,
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            scaffoldMessengerKey: snackBar,
            title: "ChatBot",
            theme: theme,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
