import 'package:talk_with_bot/data/models/gpt_models.dart' hide Message;
import 'package:talk_with_bot/domain/entities/message.dart';
import 'package:talk_with_bot/utils/const.dart';

extension MessageMapper on dynamic {
  toMessage(String sender) {
    if (this is ChatModel) {
      return Message(
        dateTime: dateTime,
        sender: sender,
        message: this.choices![0].message!.content.toString(),
      );
    } else {
      return Message(dateTime: dateTime, sender: sender, message: this);
    }
  }
}
