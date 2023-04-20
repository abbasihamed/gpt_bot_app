import 'package:talk_with_bot/domain/repository/local_repository.dart';
import 'package:talk_with_bot/domain/usecase/base_usecase.dart';
import 'package:talk_with_bot/utils/data_state.dart';

class ApiKeyUseCase extends BaseUseCase<DataState, String> {
  final LocalRepository _localRepository;

  ApiKeyUseCase(this._localRepository);

  @override
  Future<DataState> execute(String params) async {
    return await _localRepository.getData(params);
  }
}
