import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:talk_with_bot/presentations/components/app_loading.dart';
import 'package:talk_with_bot/presentations/components/message_card.dart';
import 'package:talk_with_bot/presentations/provider/question_controller.dart';
import 'package:talk_with_bot/utils/theme.dart';

class ChatScreen extends HookWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
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
                child: ListView.builder(
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
              if (controller.isLoading) const AppLoading(),
              child!,
            ],
          );
        },
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: theme(context).cardColor,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextFormField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: 'Question...',
                  ),
                ),
              ),
              InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  if (textController.text.isNotEmpty) {
                    context
                        .read<QuestionController>()
                        .sendData(textController.text);
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
}
