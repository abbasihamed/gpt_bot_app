import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:talk_with_bot/injection.dart';
import 'package:talk_with_bot/presentations/components/message_card.dart';
import 'package:talk_with_bot/presentations/logic/api_key_controller.dart';
import 'package:talk_with_bot/presentations/logic/chat_controller.dart';
import 'package:talk_with_bot/presentations/logic/theme_controller.dart';
import 'package:talk_with_bot/presentations/screens/setting.dart';
import 'package:talk_with_bot/utils/app_theme.dart';
import 'package:talk_with_bot/utils/internet_connetcion.dart';
import 'package:talk_with_bot/utils/mediaquery.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textController = useTextEditingController();
    final scrollController = useScrollController();
    final key = Provider.of<KeyController>(context, listen: false);
    // getIt.get<InternetConnection>().checker();
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        title: const Text('Bot'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingScreen(),
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

                  getIt.get<ThemeDataController>().addData(
                        key: 'theme',
                        value: theme.brightness,
                      );
                },
                icon: theme.brightness == Brightness.light
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode),
              );
            },
          ),
        ],
        elevation: 0,
      ),
      body: Consumer<ChatController>(
        builder: (context, controller, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowIndicator();
                    return true;
                  },
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: controller.isLoading
                        ? controller.messagesList.length + 1
                        : controller.messagesList.length,
                    itemBuilder: (context, index) {
                      if (controller.isLoading &&
                          controller.messagesList.length == index) {
                        return const MessagesCard(
                          isLoading: true,
                          sender: 'bot',
                        );
                      }
                      return MessagesCard(
                        sender: controller.messagesList[index].sender,
                        message: controller.messagesList[index].message
                            .replaceAll('\n', ''),
                        date: Jiffy(controller.messagesList[index].dateTime).jm,
                      );
                    },
                  ),
                ),
              ),
              child!,
            ],
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: TextFormField(
                      controller: textController,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      maxLines: 5,
                      minLines: 1,
                      decoration: const InputDecoration(
                        hintText: 'Message ...',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: kWidth(context) * 0.02),
                InkWell(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {
                    if (textController.text.isNotEmpty) {
                      context
                          .read<ChatController>()
                          .sendMessage(textController.text, key: key);
                      scrollToEnd(scrollController);
                      textController.clear();
                      FocusScope.of(context).unfocus();
                    }
                  },
                  child: CircleAvatar(
                    maxRadius: 22,
                    backgroundColor: theme.cardColor,
                    child: Icon(
                      Icons.send,
                      color: theme.iconTheme.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  scrollToEnd(ScrollController controller) {
    controller.animateTo(controller.position.maxScrollExtent * 2,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
