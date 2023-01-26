import 'package:flutter/material.dart';
import 'package:talk_with_bot/injection.dart';
import 'package:talk_with_bot/utils/app_theme.dart';
import 'package:talk_with_bot/utils/shared_controller.dart';

class ThemeController {
  final shared = getIt.get<SharedController>();

  setTheme(Brightness theme) async {
    if (theme == Brightness.light) {
      await shared.saveDate(key: 'theme', value: 'dark');
    }
    if (theme == Brightness.dark) {
      await shared.saveDate(key: 'theme', value: 'light');
    }
  }

  getTheme() async {
    final theme = await shared.getData(key: 'theme');
    if (theme == null) {
      return AppTheme.lightTheme;
    }
    if (theme == 'light') {
      return AppTheme.lightTheme;
    } else {
      return AppTheme.darkTheme;
    }
  }
}
