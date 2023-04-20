import 'dart:convert';
import 'dart:io';

import 'package:talk_with_bot/data/models/gpt_models.dart';
import 'package:talk_with_bot/data/remote/gpt_api_service.dart';
import 'package:talk_with_bot/domain/repository/remote_repository.dart';
import 'package:talk_with_bot/utils/data_state.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  final GptServiceApi _gptServiceApi;

  RemoteRepositoryImpl(this._gptServiceApi);

  @override
  Future<DataState> sendMessage(String message, {String? key}) async {
    try {
      var response = await _gptServiceApi.sendMessage(message, key: key);
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
