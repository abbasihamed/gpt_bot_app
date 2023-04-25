import 'package:talk_with_bot/data/local/hive_storage.dart';
import 'package:talk_with_bot/domain/repository/local_repository.dart';
import 'package:talk_with_bot/utils/data_state.dart';

class LocalRepositoryImpl implements LocalRepository {
  final HiveStorage _hiveStorage;

  LocalRepositoryImpl(this._hiveStorage);

  @override
  Future<DataState> getData(String key) async {
    var response = await _hiveStorage.getData(key);
    if (response != null) {
      return Success(data: response, code: 200);
    } else {
      return Failed(data: null, code: 404);
    }
  }

  @override
  bool setData(String key, String value) {
    return _hiveStorage.addData(key, value);
  }
}
