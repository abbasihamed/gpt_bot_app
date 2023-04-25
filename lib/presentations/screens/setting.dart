import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:talk_with_bot/domain/usecase/set_api_local_usecase.dart';
import 'package:talk_with_bot/injection.dart';
import 'package:talk_with_bot/presentations/screens/home_screen.dart';
import 'package:talk_with_bot/utils/const.dart';
import 'package:talk_with_bot/utils/mediaquery.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends HookWidget {
  SettingScreen({super.key});

  final _apiKey = getIt.get<SetApiKeyUseCase>();

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              bootomSheet(context, theme, textController);
            },
            title: Text(
              'API Keys',
              style: theme.textTheme.bodyMedium,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }

  void bootomSheet(
      BuildContext context, ThemeData theme, TextEditingController controller) {
    showModalBottomSheet(
      enableDrag: false,
      barrierColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 250,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  cursorColor: theme.colorScheme.onPrimaryContainer,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'API Key',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '1- Go to ',
                      style: theme.textTheme.labelSmall!.copyWith(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () async {
                        await launchUrl(Uri.parse(
                            'https://platform.openai.com/account/api-keys'));
                      },
                      child: const Text(
                        'Site',
                      ),
                    )
                  ],
                ),
                Text(
                  '2- Log in + Generate new secret key',
                  style: theme.textTheme.labelSmall!.copyWith(fontSize: 16),
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      final Map keyMap = {
                        'key': secretKey,
                        'value': controller.text,
                      };
                      _apiKey.execute(keyMap);
                      Navigator.pop(context);
                      if (kIsWeb) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: kWidth(context) * 0.4,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Done',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
