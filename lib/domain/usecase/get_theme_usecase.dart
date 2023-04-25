import 'package:talk_with_bot/domain/repository/local_repository.dart';
import 'package:talk_with_bot/domain/usecase/base_usecase.dart';
import 'package:talk_with_bot/utils/data_state.dart';

class GetThemeUseCase extends BaseUseCase<DataState, String> {
  final LocalRepository _localRepository;

  GetThemeUseCase(this._localRepository);

  @override
  Future<DataState> execute(String params) {
    return _localRepository.getData(params);
  }
}
