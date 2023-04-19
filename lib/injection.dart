import 'package:get_it/get_it.dart';
import 'package:talk_with_bot/data/local/hive_storage_imp.dart';
import 'package:talk_with_bot/data/remote/gpt_api_service.dart';
import 'package:talk_with_bot/data/remote/gpt_api_service_impl.dart';
import 'package:talk_with_bot/data/repository/repositoty_impl.dart';
import 'package:talk_with_bot/domain/repository/repository.dart';
import 'package:talk_with_bot/domain/usecase/message_usecase.dart';
import 'package:talk_with_bot/presentations/logic/theme_controller.dart';
import 'package:talk_with_bot/utils/internet_connetcion.dart';

final getIt = GetIt.I;

void setup() {
  getIt.registerSingleton(InternetConnection());
  getIt.registerSingleton(HiveStorageImp());
  getIt.registerSingleton(ThemeDataController());
  getIt.registerLazySingleton<GptServiceApi>(() => GptServiceApiImpl());
  getIt.registerLazySingleton<Repository>(() => RepositoryImpl(getIt()));
  getIt.registerSingleton<MessageUseCase>(MessageUseCase(getIt()));
}
