import 'dart:convert';
import 'dart:io';

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
      if (response.statusCode == 200) {
        return Success(data: qandAModelsFromJson(response.body), code: 200);
      }
      if (response.statusCode == 404) {
        return Failed(code: 104, data: 'Data not found');
      }
      return Failed(code: 100, data: 'Invalid Response');
    } on HttpException {
      return Failed(code: 101, data: 'No Internet Connection');
    } on FormatException {
      return Failed(code: 102, data: 'Invalid Response format');
    } on SocketException {
      return Failed(code: 103, data: 'No Internet Connection');
    } catch (e) {
      return Failed(code: 400, data: 'Unkown Error');
    }
  }
}
