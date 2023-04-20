import 'package:flutter/material.dart';
import 'package:talk_with_bot/domain/usecase/api_key_usecase.dart';
import 'package:talk_with_bot/injection.dart';

class KeyController extends ChangeNotifier {
  final _storageImp = getIt.get<ApiKeyUseCase>();

  String? _currentKey;

  String? get currentKey => _currentKey;

  KeyController() {
    getkey();
  }

  addKey({required String value}) {
    // _storageImp.addData('secretKey', value);
    // setCurrentKey(value);
  }

  setCurrentKey(String? value) {
    if (value != null && value.isNotEmpty) {
      _currentKey = value;
    } else {
      _currentKey = null;
    }
    notifyListeners();
  }

  getkey() async {
    final response = await _storageImp.execute('secretKey');
    setCurrentKey(response.data as String);
  }
}
