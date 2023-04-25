import 'package:get_it/get_it.dart';
import 'package:talk_with_bot/data/local/hive_storage.dart';
import 'package:talk_with_bot/data/local/hive_storage_imp.dart';
import 'package:talk_with_bot/data/remote/gpt_api_service.dart';
import 'package:talk_with_bot/data/remote/gpt_api_service_impl.dart';
import 'package:talk_with_bot/data/repository/local_repository_impl.dart';
import 'package:talk_with_bot/data/repository/remote_repositoty_impl.dart';
import 'package:talk_with_bot/domain/repository/local_repository.dart';
import 'package:talk_with_bot/domain/repository/remote_repository.dart';
import 'package:talk_with_bot/domain/usecase/api_usecase.dart';
import 'package:talk_with_bot/domain/usecase/get_theme_usecase.dart';
import 'package:talk_with_bot/domain/usecase/message_usecase.dart';
import 'package:talk_with_bot/domain/usecase/set_api_local_usecase.dart';
import 'package:talk_with_bot/domain/usecase/set_theme_usecase.dart';
import 'package:talk_with_bot/utils/internet_connetcion.dart';

final getIt = GetIt.I;

void setup() {
  getIt.registerSingleton(InternetConnection());
  getIt.registerSingleton(HiveStorageImp());
  getIt.registerLazySingleton<HiveStorage>(() => HiveStorageImp());
  getIt.registerSingleton<LocalRepository>(
       LocalRepositoryImpl(getIt()));

  getIt.registerSingleton<ApiKeyUseCase>(ApiKeyUseCase(getIt()));
  getIt.registerSingleton<SetApiKeyUseCase>(SetApiKeyUseCase(getIt()));
  getIt.registerLazySingleton<GptServiceApi>(() => GptServiceApiImpl());
  getIt.registerLazySingleton<RemoteRepository>(
      () => RemoteRepositoryImpl(getIt()));
  getIt.registerSingleton<MessageUseCase>(MessageUseCase(getIt()));

  getIt.registerSingleton<SetThemeUseCase>(SetThemeUseCase(getIt()));
  getIt.registerSingleton<GetThemeUseCase>(GetThemeUseCase(getIt()));
}
