import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:talk_with_bot/data/remote/gpt_api_service.dart';
import 'package:talk_with_bot/utils/const.dart';

class GptServiceApiImpl implements GptServiceApi {
  @override
  Future<http.Response> sendMessage(String message, {String? key}) async {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${key ?? apiKey}'
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content": message,
          }
        ]
      }),
    );
    return response;
  }
}
