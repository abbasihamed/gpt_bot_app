import 'dart:convert';
import 'dart:io';

import 'package:talk_with_bot/data/models/gpt_models.dart';
import 'package:talk_with_bot/data/remote/gpt_api_service.dart';
import 'package:talk_with_bot/domain/repository/repository.dart';
import 'package:talk_with_bot/utils/data_state.dart';

class RepositoryImpl implements Repository {
  final GptServiceApi _gptServiceApi;

  RepositoryImpl(this._gptServiceApi);

  @override
  Future<DataState> sendMessage(String message) async {
    try {
      var response = await _gptServiceApi.sendMessage(message);
      if (response.statusCode == 200) {
        return Success(
            data: chatModelFromJson(utf8.decode(response.bodyBytes)),
            code: 200);
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
