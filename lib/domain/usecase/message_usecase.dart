import 'package:talk_with_bot/domain/repository/remote_repository.dart';
import 'package:talk_with_bot/domain/usecase/base_usecase.dart';
import 'package:talk_with_bot/utils/data_state.dart';

class MessageUseCase implements BaseUseCase<DataState, String> {
  final RemoteRepository _repository;

  MessageUseCase(this._repository);

  @override
  Future<DataState> execute(String message, {String? key}) async {
    return await _repository.sendMessage(message, key: key);
  }
}
