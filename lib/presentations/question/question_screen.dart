import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:talk_with_bot/presentations/components/message_card.dart';
import 'package:talk_with_bot/presentations/provider/question_controller.dart';
import 'package:talk_with_bot/utils/mediaquery.dart';
import 'package:talk_with_bot/utils/theme.dart';

class QuestionScreen extends HookWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final scrollController = useScrollController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bot'),
      ),
      body: Consumer<QuestionController>(
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
                        ? controller.qAndALists.length + 1
                        : controller.qAndALists.length,
                    itemBuilder: (context, index) {
                      if (controller.isLoading &&
                          controller.qAndALists.length == index) {
                        return const MessagesCard(
                          isLoading: true,
                          sender: 'bot',
                        );
                      }
                      return MessagesCard(
                        sender: controller.qAndALists[index].sender,
                        message: controller.qAndALists[index].message
                            .replaceAll('\n', ''),
                        date: Jiffy(controller.qAndALists[index].dateTime).jm,
                      );
                    },
                  ),
                ),
              ),
              child!,
            ],
          );
        },
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: theme(context).cardColor,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: TextFormField(
                    controller: textController,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    maxLines: 5,
                    minLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'Question...',
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
                        .read<QuestionController>()
                        .sendData(textController.text);
                    scrollToEnd(scrollController);
                    textController.clear();
                  }
                },
                child: CircleAvatar(
                  maxRadius: 22,
                  backgroundColor: theme(context).cardColor,
                  child: Icon(
                    Icons.send,
                    color: theme(context).iconTheme.color,
                  ),
                ),
              ),
            ],
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
