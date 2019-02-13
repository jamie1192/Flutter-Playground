import 'dart:convert';

Word wordFromJson(String str) {
  final jsonData = json.decode(str);
  return Word.fromJson(jsonData);
}

String wordToJson(Word data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Word {
  int id;
  String word;

  Word({
    this.id,
    this.word,
  });

  factory Word.fromJson(Map<String, dynamic> json) => new Word(
    id: json["id"],
    word: json["word"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "word": word,
  };
}