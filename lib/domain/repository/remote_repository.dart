import 'package:talk_with_bot/utils/data_state.dart';

abstract class RemoteRepository {
  Future<DataState> sendMessage(String message, {String? key});
}
