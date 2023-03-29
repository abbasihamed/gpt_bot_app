import 'package:flutter/material.dart';
import 'package:talk_with_bot/data/local/hive_storage_imp.dart';
import 'package:talk_with_bot/injection.dart';
import 'package:talk_with_bot/utils/app_theme.dart';

class ThemeDataController {
  final _storageImp = getIt.get<HiveStorageImp>();

  addData({required String key, required Brightness value}) {

        _storageImp.addData(key, value == Brightness.light ? 'dark' : 'light');
  }

  ThemeData getData() {
    final theme = _storageImp.getData('theme');
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
