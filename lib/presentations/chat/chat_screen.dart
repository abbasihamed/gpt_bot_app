import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:talk_with_bot/presentations/components/app_loading.dart';
import 'package:talk_with_bot/presentations/components/message_card.dart';
import 'package:talk_with_bot/presentations/provider/question_controller.dart';
import 'package:talk_with_bot/utils/mediaquery.dart';
import 'package:talk_with_bot/utils/theme.dart';

class ChatScreen extends HookWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final visible = useState(true);
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
              if (visible.value)
                Container(
                  width: double.infinity,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.amber[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text(
                          'No history will be saved',
                          style: TextStyle(wordSpacing: 1.2),
                        ),
                      ),
                      InkWell(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        onTap: () {
                          visible.value = false;
                        },
                        child: const Icon(Icons.close),
                      )
                    ],
                  ),
                ),
              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowIndicator();
                    return true;
                  },
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: controller.qAndALists.length,
                    itemBuilder: (context, index) {
                      return MessagesCard(
                        sender: controller.qAndALists[index].sender,
                        message: controller.qAndALists[index].message,
                        date: '12:50 pm',
                      );
                    },
                  ),
                ),
              ),
              if (controller.isLoading) const AppLoading(),
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
