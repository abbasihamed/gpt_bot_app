import 'package:talk_with_bot/utils/data_state.dart';

abstract class Repository {
  Future<DataState> sendMessage(String message);
}
