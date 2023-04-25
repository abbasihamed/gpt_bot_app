import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:talk_with_bot/domain/usecase/set_theme_usecase.dart';
import 'package:talk_with_bot/injection.dart';
import 'package:talk_with_bot/presentations/screens/setting.dart';
import 'package:talk_with_bot/utils/app_theme.dart';
import 'package:talk_with_bot/utils/const.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({super.key});

  final setTheme = getIt.get<SetThemeUseCase>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Bot'),
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SettingScreen(),
            ),
          );
        },
        icon: const Icon(Icons.settings),
      ),
      actions: [
        ThemeSwitcher.withTheme(
          builder: (context, switcher, theme) {
            return IconButton(
              onPressed: () {
                switcher.changeTheme(
                  theme: theme.brightness == Brightness.light
                      ? AppTheme.darkTheme
                      : AppTheme.lightTheme,
                );

                final Map<String, dynamic> params = {
                  'key': themeKey,
                  'value':
                      theme.brightness == Brightness.light ? 'dark' : 'light',
                };

                setTheme.execute(params);
              },
              icon: theme.brightness == Brightness.light
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
            );
          },
        ),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
