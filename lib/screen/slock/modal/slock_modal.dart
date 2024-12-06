class SlockModal {
  int? id, chapter_id, chapter_number, externalId, verse_number, verse_order;
  String? text, title, transliteration, word_meanings;

  SlockModal(
      {this.id,
      this.chapter_id,
      this.chapter_number,
      this.externalId,
      this.verse_number,
      this.verse_order,
      this.text,
      this.title,
      this.transliteration,
      this.word_meanings});

  factory SlockModal.MAptoModal(Map m1) {
    return SlockModal(
      chapter_number: m1['chapter_number'],
      title: m1['title'],
      chapter_id: m1['chapter_id'],
      id: m1['id'],
      externalId: m1['externalId'],
      text: m1['text'],
      transliteration: m1['transliteration'],
      word_meanings: m1['word_meanings'],
      verse_number: m1['verse_number'],
      verse_order: m1['verse_order'],
    );
  }
}
