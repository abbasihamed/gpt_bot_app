import 'package:get_it/get_it.dart';
import 'package:talk_with_bot/data/local/hive_storage_imp.dart';
import 'package:talk_with_bot/data/remote/chat_with_bot.dart';
import 'package:talk_with_bot/presentations/logic/theme_controller.dart';
import 'package:talk_with_bot/utils/internet_connetcion.dart';

final getIt = GetIt.I;

void setup() {
  getIt.registerSingleton(ChatBot());
  getIt.registerSingleton(InternetConnection());
  getIt.registerSingleton(HiveStorageImp());
  getIt.registerSingleton(ThemeDataController());
}
