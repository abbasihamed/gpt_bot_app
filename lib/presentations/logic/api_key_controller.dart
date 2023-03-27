import 'package:flutter/material.dart';
import 'package:talk_with_bot/data/local/hive_storage_imp.dart';
import 'package:talk_with_bot/injection.dart';

class KeyController extends ChangeNotifier {
  final _storageImp = getIt.get<HiveStorageImp>();

  String? _currentKey;

  String? get currentKey => _currentKey;

  KeyController() {
    getkey();
  }

  addKey({required String value}) {
    final callBack = _storageImp.addData('secretKey', value);
    setCurrentKey(value);
    print(callBack);
  }

  setCurrentKey(String? value) {
    if (value != null && value.isNotEmpty) {
      _currentKey = value;
    } else {
      _currentKey = null;
    }
    notifyListeners();
  }

  getkey() {
    final value = _storageImp.getData('secretKey');
    print(value);
    setCurrentKey(value);
  }
}
