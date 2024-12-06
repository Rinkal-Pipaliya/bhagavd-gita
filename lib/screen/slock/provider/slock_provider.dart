import 'package:departur_app/screen/slock/modal/slock_modal.dart';
import 'package:departur_app/utils/helper/shr_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SlockProvider with ChangeNotifier {
  List<SlockModal> dataList = [];
  FlutterTts flutterTts = FlutterTts();

  void speak(String text) {
    flutterTts.speak(text);
  }

  void stop() {
    flutterTts.pause();
  }

  void getSlock() async {
    SlockHelper helper = SlockHelper();
    dataList = await helper.slockJsonParsing();
    notifyListeners();
  }
}
