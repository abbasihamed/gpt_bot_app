import 'package:talk_with_bot/domain/repository/local_repository.dart';
import 'package:talk_with_bot/domain/usecase/base_usecase.dart';

class SetApiKeyUseCase extends BaseUseCase<bool, Map> {
  final LocalRepository _localRepository;
  SetApiKeyUseCase(this._localRepository);
  @override
  Future<bool> execute(Map params) async {
    return _localRepository.setData(params['key'], params['value']);
  }
}
