import 'dart:async';

import 'package:fimber/fimber.dart';
import 'package:flutter_playground/blocs/bloc_provider.dart';
import 'package:flutter_playground/database/database.dart';
import 'package:flutter_playground/models/word.dart';


class WordBloc extends BlocBase {
  WordBloc() {
    getWords();
  }

  final _wordController = StreamController<List<Word>>.broadcast();
  get words => _wordController.stream;

  void dispose() {
    Fimber.i('WordBloc disposed');
    _wordController.close();
  }

  addWord(Word word) {
    DBProvider.db.newWord(word);
    getWords();
  }

  getWords() async {
    _wordController.sink.add(await DBProvider.db.getAllWords());
  }


  delete(int id) {
    DBProvider.db.deleteWord(id);
    getWords();
  }

}

// final bloc = WordBloc();
