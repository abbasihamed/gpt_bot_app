import 'package:talk_with_bot/entity/gpt.dart';
import 'package:talk_with_bot/models/gpt_models.dart';
import 'package:talk_with_bot/utils/const.dart';

class QandAMapper {
  static transferToMAp(String sender, dynamic data) {
    if (data is ChatModel) {
      return Gpt(
          dateTime: dateTime,
          sender: sender,
          message: data.choices![0].message!.content.toString());
    }
    if (data is String) {
      return Gpt(dateTime: dateTime, sender: sender, message: data);
    }
  }
}
