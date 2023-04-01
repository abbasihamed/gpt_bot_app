import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceToTextController extends ChangeNotifier {
  final SpeechToText _speechToText = SpeechToText();

  bool _isFinal = false;

  bool get isFinal => _isFinal;

  setMessage(String value, TextEditingController controller) {
    controller.text = value;
    notifyListeners();
  }

  setIsFinal(bool value) {
    _isFinal = value;
    notifyListeners();
  }

  startRecorde(TextEditingController controller) async {
    var init = await _speechToText.initialize();
    if (init) {
      _speechToText.listen(
        localeId: 'en-US',
        onResult: (result) {
          setMessage(result.recognizedWords, controller);
          setIsFinal(result.finalResult);
          print(result);
        },
      );
    }
  }

  stopRecorde() async {
    await _speechToText.cancel();
  }
}
