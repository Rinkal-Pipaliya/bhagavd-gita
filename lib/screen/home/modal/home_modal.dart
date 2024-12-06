class ChapterModal {
  int? chapter_number, id, verses_count;
  String? chapter_summary,
      chapter_summary_hindi,
      image_name,
      name,
      img,
      name_meaning,
      name_translation,
      name_transliterated;

  ChapterModal({
    this.chapter_number,
    this.chapter_summary,
    this.chapter_summary_hindi,
    this.id,
    this.image_name,
    this.name,
    this.img,
    this.name_meaning,
    this.name_translation,
    this.name_transliterated,
    this.verses_count,
  });

  factory ChapterModal.MAptoModal(Map m1) {
    return ChapterModal(
      chapter_number: m1['chapter_number'],
      chapter_summary: m1['chapter_summary'],
      chapter_summary_hindi: m1['chapter_summary_hindi'],
      id: m1['id'],
      image_name: m1['image_name'],
      name: m1['name'],
      img: m1['img'],
      name_meaning: m1['name_meaning'],
      name_translation: m1['name_translation'],
      name_transliterated: m1['name_transliterated'],
      verses_count: m1['verses_count'],
    );
  }
}

class LanguageModal {
  int? id;
  String? language;

  LanguageModal({this.id, this.language});

  factory LanguageModal.mapToModal(Map m1) {
    return LanguageModal(
      id: m1['id'],
      language: m1['language'],
    );
  }
}
