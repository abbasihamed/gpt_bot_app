import 'package:flutter/material.dart';
import 'package:talk_with_bot/data/mapper/message_mapper.dart';
import 'package:talk_with_bot/data/models/gpt_models.dart' show ChatModel;
import 'package:talk_with_bot/domain/entities/errors.dart';
import 'package:talk_with_bot/domain/entities/message.dart';
import 'package:talk_with_bot/domain/usecase/api_key_usecase.dart';
import 'package:talk_with_bot/domain/usecase/message_usecase.dart';
import 'package:talk_with_bot/injection.dart';
import 'package:talk_with_bot/presentations/logic/api_key_controller.dart';
import 'package:talk_with_bot/utils/data_state.dart';

class ChatController extends ChangeNotifier {
  final _messageUsecase = getIt.get<MessageUseCase>();
  final _apiKey = getIt.get<ApiKeyUseCase>();

  final List<Message> _messagesList = [];
  Error? _errorData;
  bool _isloading = false;

  List<Message> get messagesList => _messagesList;
  Error get errorData => _errorData!;
  bool get isLoading => _isloading;

  setLoading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  setMessage(Message value) {
    _messagesList.add(value);
    notifyListeners();
  }

  setErrorData(Error value) {
    _errorData = value;
    notifyListeners();
  }

  Future<String?> getApiKey() async {
    final response = await _apiKey.execute('secretKey');
    return response.data;
  }

  sendMessage(String message, {KeyController? key}) async {
    setMessage(message.toMessage('user'));
    setLoading(true);
    final key = await getApiKey();
    var response = await _messageUsecase.execute(message, key: key);
    if (response is Success) {
      setMessage((response.data as ChatModel).toMessage('bot'));
    }
    if (response is Failed) {
      // ToDo: set error response
    }
    setLoading(false);
    notifyListeners();
  }
}
