import 'package:flutter/material.dart';
import 'package:talk_with_bot/data/remote/chat_with_bot.dart';
import 'package:talk_with_bot/entity/errors.dart';
import 'package:talk_with_bot/entity/gpt.dart';
import 'package:talk_with_bot/injection.dart';
import 'package:talk_with_bot/presentations/logic/api_key_controller.dart';
import 'package:talk_with_bot/utils/data_state.dart';
import 'package:talk_with_bot/utils/mapper.dart';

class ChatController extends ChangeNotifier {
  final chat = getIt.get<ChatBot>();

  final List<Gpt> _messagesList = [];
  Error? _errorData;
  bool _isloading = false;

  List<Gpt> get messagesList => _messagesList;
  Error get errorData => _errorData!;
  bool get isLoading => _isloading;

  setLoading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  setMessage(Gpt value) {
    _messagesList.add(value);
    notifyListeners();
  }

  setErrorData(Error value) {
    _errorData = value;
    notifyListeners();
  }

  sendMessage(String message,{KeyController? key}) async {
    final mapped = QandAMapper.transferToMAp('user', message);
    setMessage(mapped);
    setLoading(true);
    var response = await chat.sendData(text: message,key: key!.currentKey);
    if (response is Success) {
      final mapped = QandAMapper.transferToMAp('bot', response.data);
      setMessage(mapped);
    }
    if (response is Failed) {
      Error error = Error(code: response.code, message: response.data);
      setErrorData(error);
    }
    setLoading(false);
    notifyListeners();
  }
}
