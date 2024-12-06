import 'dart:convert';

import 'package:departur_app/screen/home/modal/home_modal.dart';
import 'package:departur_app/screen/slock/modal/slock_modal.dart';
import 'package:flutter/services.dart';

class ChaptersHelper {
  Future<List<ChapterModal>> chaptersJsonParsing() async {
    String jsonString =
        await rootBundle.loadString('assets/json/chapters.json');
    List json = jsonDecode(jsonString);
    List<ChapterModal> chList =
        json.map((e) => ChapterModal.MAptoModal(e)).toList();
    return chList;
  }
}

class SlockHelper {
  Future<List<SlockModal>> slockJsonParsing() async {
    String jsonString = await rootBundle.loadString('assets/json/slock.json');
    List json = jsonDecode(jsonString);
    List<SlockModal> slockList =
        json.map((e) => SlockModal.MAptoModal(e)).toList();
    return slockList;
  }
}

class LanguageHelper {
  Future<List<LanguageModal>> languageJsonParsing() async {
    String jsonString =
        await rootBundle.loadString("assets/json/languages.json");
    List json = jsonDecode(jsonString);
    List<LanguageModal> langList =
        json.map((e) => LanguageModal.mapToModal(e)).toList();
    return langList;
  }
}
