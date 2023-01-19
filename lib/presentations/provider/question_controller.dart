import 'package:flutter/material.dart';
import 'package:talk_with_bot/data/send_question.dart';
import 'package:talk_with_bot/entity/qanda.dart';
import 'package:talk_with_bot/injection.dart';
import 'package:talk_with_bot/utils/data_state.dart';
import 'package:talk_with_bot/utils/mapper.dart';

class QuestionController extends ChangeNotifier {
  final question = getIt.get<SendQuestion>();

  final List<QandA> _qAndALists = [];
  bool _isLoading = false;

  List<QandA> get qAndALists => _qAndALists;
  bool get isLoading => _isLoading;

  setData(QandA value) {
    _qAndALists.add(value);
    notifyListeners();
  }

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  sendData(String value) async {
    setLoading(true);
    final maped = QandAMapper.transferToMAp('user', value);
    setData(maped);
    final response = await question.sendQuestion(value);
    if (response is Success) {
      final maped = QandAMapper.transferToMAp('bot', response.data);
      setData(maped);
    } else {
      print('Has a Error');
    }
    setLoading(false);
    notifyListeners();
  }
}
