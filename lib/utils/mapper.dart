import 'package:talk_with_bot/entity/qanda.dart';
import 'package:talk_with_bot/models/qanda_model.dart';
import 'package:talk_with_bot/utils/const.dart';

class QandAMapper {
  static transferToMAp(String sender, dynamic data) {
    if (data is QandAModels) {
      return QandA(
          dateTime: dateTime,
          sender: sender,
          message: data.choices![0].text.toString());
    }
    if (data is String) {
      return QandA(dateTime: dateTime, sender: sender, message: data);
    }
  }
}
