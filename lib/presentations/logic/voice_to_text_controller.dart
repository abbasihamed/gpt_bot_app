import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceToTextController extends ChangeNotifier {
  final SpeechToText _speechToText = SpeechToText();

  String? _message;

  String get message => _message ?? '';

  setMessage(String value) {
    _message = value;
    notifyListeners();
  }

  startRecorde() async {
    var init = await _speechToText.initialize();
    if (init) {
      _speechToText.listen(
        localeId: 'en-US',
        onResult: (result) {
          setMessage(result.recognizedWords);
          print(result);
        },
      );
    }
  }

  stopRecorde() async {
    await _speechToText.cancel();
  }
}
