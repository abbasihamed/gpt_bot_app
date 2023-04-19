import 'package:http/http.dart' as http;

abstract class GptServiceApi {
  Future<http.Response> sendMessage(String message, {String? key});
}
