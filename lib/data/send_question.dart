import 'dart:convert';

import 'package:talk_with_bot/models/qanda_model.dart';
import 'package:talk_with_bot/utils/const.dart';
import 'package:talk_with_bot/utils/data_state.dart';

import 'package:http/http.dart' as http;

class SendQuestion {
  Future<DataState> sendQuestion(String value) async {
    try {
      var response = await http.post(
        Uri.parse('https://api.openai.com/v1/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey'
        },
        body: jsonEncode(
            {"model": "text-davinci-003", "prompt": value, "max_tokens": 100}),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return Success(data: qandAModelsFromJson(response.body), code: 200);
      }
      return Failed(data: 'Not Valid response', code: 404);
    } catch (e) {
      return Failed(data: 'Not Valid response', code: 404);
    }
  }
}
