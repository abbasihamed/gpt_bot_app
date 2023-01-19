import 'package:talk_with_bot/entity/qanda.dart';
import 'package:talk_with_bot/models/qanda_model.dart';

class QandAMapper {
  static transferToMAp(String sender, dynamic data) {
    if (data is QandAModels) {
      return QandA(
          sender: sender,
          message: data.choices![0].text.toString().replaceAll(r'\n\n', ''));
    }
    if (data is String) {
      return QandA(sender: sender, message: data);
    }
  }
}
