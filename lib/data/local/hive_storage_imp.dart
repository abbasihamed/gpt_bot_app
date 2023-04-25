import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:talk_with_bot/data/local/hive_storage.dart';

class HiveStorageImp implements HiveStorage {
  final String _boxName = 'chat';

  @override
  initDb() async {
    try {
      final appDocumentDir =
          await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
      await Hive.openBox(_boxName);
    } catch (e) {
      print(e);
    }
  }

  @override
  bool addData(String key, String value) {
    try {
      var box = Hive.box(_boxName);
      box.put(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  getData(String key) {
    var box = Hive.box(_boxName);
    return box.get(key);
  }
}
