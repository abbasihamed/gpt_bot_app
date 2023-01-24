import 'package:get_it/get_it.dart';
import 'package:talk_with_bot/data/chat_with_bot.dart';
import 'package:talk_with_bot/data/send_question.dart';

final getIt = GetIt.I;

void setup() {
  getIt.registerSingleton(SendQuestion());
  getIt.registerSingleton(ChatBot());
}
