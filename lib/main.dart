import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_with_bot/data/local/hive_storage_imp.dart';
import 'package:talk_with_bot/domain/usecase/get_theme_usecase.dart';
import 'package:talk_with_bot/injection.dart';
import 'package:talk_with_bot/presentations/logic/chat_controller.dart';
import 'package:talk_with_bot/presentations/logic/voice_to_text_controller.dart';
import 'package:talk_with_bot/presentations/screens/home_screen.dart';
import 'package:talk_with_bot/presentations/screens/setting.dart';
import 'package:talk_with_bot/utils/app_theme.dart';
import 'package:talk_with_bot/utils/const.dart';
import 'package:talk_with_bot/utils/get_certification.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  setup();
  await getIt.get<HiveStorageImp>().initDb();

  HttpOverrides.global = MyHttpOverrides();

  final theme = await getIt.get<GetThemeUseCase>().execute(themeKey);

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return MyApp(initialTheme: (theme.data as String?)?.getTheme() ?? AppTheme.lightTheme);
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  final ThemeData initialTheme;
  const MyApp({super.key, required this.initialTheme});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatController()),
        ChangeNotifierProvider(create: (_) => VoiceToTextController()),
      ],
      child: ThemeProvider(
        initTheme: initialTheme,
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            scaffoldMessengerKey: snackBar,
            title: "ChatBot",
            theme: theme,
            home: getStartPage(),
          );
        },
      ),
    );
  }

  Widget getStartPage() {
    if (kIsWeb) {
      return SettingScreen();
    } else {
      return const HomeScreen();
    }
  }
}
