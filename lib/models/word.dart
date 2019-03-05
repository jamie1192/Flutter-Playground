import 'dart:convert';

Word wordFromJson(String str) {
  final jsonData = json.decode(str);
  return Word.fromMap(jsonData);
}

String wordToJson(Word data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Word {
  int id;
  String word;

  Word({
    this.id,
    this.word,
  });

  factory Word.fromMap(Map<String, dynamic> json) => new Word(
    id: json["id"],
    word: json["word"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "word": word,
  };
}