import 'package:talk_with_bot/domain/repository/local_repository.dart';
import 'package:talk_with_bot/domain/usecase/base_usecase.dart';

class SetThemeUseCase extends BaseUseCase<bool, Map<String, dynamic>> {
  final LocalRepository _localRepository;

  SetThemeUseCase(this._localRepository);

  @override
  Future<bool> execute(Map<String, dynamic> params) async {
    return _localRepository.setData(params['key'], params['value']);
  }
}
