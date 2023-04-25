import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:talk_with_bot/presentations/components/custom_appbar.dart';
import 'package:talk_with_bot/presentations/components/message_card.dart';
import 'package:talk_with_bot/presentations/components/send_button.dart';
import 'package:talk_with_bot/presentations/logic/chat_controller.dart';
import 'package:talk_with_bot/presentations/logic/voice_to_text_controller.dart';
import 'package:talk_with_bot/utils/mediaquery.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isVoice = useState(false);
    final isAnim = useState(false);
    final theme = Theme.of(context);
    final textController = useTextEditingController();
    // final scrollController = useScrollController();

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: CustomAppBar(),
      body: Consumer2<ChatController, VoiceToTextController>(
        builder: (context, controller, voice, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowIndicator();
                    return true;
                  },
                  child: controller.messagesList.isEmpty
                      ? Lottie.asset(
                          'assets/json/lottie-empty.json',
                        )
                      : ListView.builder(
                          // controller: scrollController,
                          itemCount: controller.isLoading
                              ? controller.messagesList.length + 1
                              : controller.messagesList.length,
                          itemBuilder: (context, index) {
                            // if (controller.messagesList.isEmpty) {
                            //   return Container(
                            //     height: 200,
                            //     width: 200,
                            //     color: Colors.black,
                            //     child:
                            //   );
                            // }
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
                              date:
                                  Jiffy(controller.messagesList[index].dateTime)
                                      .jm,
                            );
                          },
                        ),
                ),
              ),
              Padding(
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
                            decoration: InputDecoration(
                              hintText:
                                  isVoice.value ? 'Speak ...' : 'Message ...',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: kWidth(context) * 0.02),
                      SendButton(
                        icon: isVoice.value ? Icons.mic : Icons.send,
                        animated: isAnim.value,
                        onTap: () {
                          if (textController.text.isNotEmpty) {
                            controller.sendMessage(textController.text);
                            // scrollToEnd(scrollController);
                            FocusScope.of(context).unfocus();
                          }
                          if (textController.text.isEmpty) {
                            isVoice.value = !isVoice.value;
                          }
                          textController.clear();
                        },
                        onLongPress: () {
                          if (isVoice.value) {
                            voice.startRecorde(textController);
                            isAnim.value = true;
                          }
                        },
                        onLongPressUp: () {
                          if (isVoice.value) {
                            voice.stopRecorde();
                            isVoice.value = !isVoice.value;
                            isAnim.value = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  scrollToEnd(ScrollController controller) {
    controller.animateTo(controller.position.maxScrollExtent * 2,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
