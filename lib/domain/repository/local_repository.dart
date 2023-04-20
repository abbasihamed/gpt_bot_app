import 'package:talk_with_bot/utils/data_state.dart';

abstract class LocalRepository {
  Future<DataState> getData(String key);
  bool setData(String key, String value);
}
