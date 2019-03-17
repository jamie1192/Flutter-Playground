import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/blocs/bloc_provider.dart';
import 'package:flutter_playground/blocs/word_bloc.dart';
import 'package:flutter_playground/models/word.dart';

class CrudScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage'),
        backgroundColor: Colors.pinkAccent,
        
      ),
      body: BlocProvider<WordBloc>(
          bloc: WordBloc(),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  NewWord(),
                  DatabaseList()
                ],
              ),
            ),
          )
        )
      );
  }
}

class NewWord extends StatefulWidget {
  final Widget child;

  NewWord({Key key, this.child}) : super(key: key);

  _NewWordState createState() => _NewWordState();
}

class _NewWordState extends State<NewWord> {
  
  final _formNewWord = GlobalKey<FormState>();
  Word _inputText;

  @override
  Widget build(BuildContext context) {
    final WordBloc wordBloc = BlocProvider.of<WordBloc>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Form(
        key:_formNewWord,
        child: ListTile(
          title: TextFormField(
            decoration: InputDecoration(
              labelText: 'Insert a word...',
              border: OutlineInputBorder()
            ),
            maxLines: 1,
            maxLength: 30,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (term) {
              if(_formNewWord.currentState.validate()) {
                Fimber.i('Done, validating: $_formNewWord');
                wordBloc.addWord(_inputText);
              }
            },
            validator: (value) {
              if (value.trim().isEmpty) {
                return 'Please enter a word.';
              }
              else {
                Word newWord = new Word(word: value);
                _inputText = newWord;
              }
            },
          ),
          trailing: RaisedButton(
            color: Colors.pink,
            onPressed: () {
              if(_formNewWord.currentState.validate()) {
                wordBloc.addWord(_inputText);
                wordBloc.getWords();
              }
            },
            child: Text('Insert',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DatabaseList extends StatefulWidget {
  final Widget child;

  DatabaseList({Key key, this.child}) : super(key: key);

  _DatabaseListState createState() => _DatabaseListState();
}

class _DatabaseListState extends State<DatabaseList> {

  @override
  Widget build(BuildContext context) {
    final WordBloc wordBloc = BlocProvider.of<WordBloc>(context);

    return Expanded(
      child: StreamBuilder<List<Word>>(
          stream: wordBloc.words,
          builder: (BuildContext context, AsyncSnapshot<List<Word>> snapshot) {
            if(snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Word word = snapshot.data[index];
                  return Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    onDismissed: (direction) {
                      if(direction == DismissDirection.endToStart) {
                        wordBloc.delete(word.id);
                      }
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(word.word),
                        leading: Text(word.id.toString()),
                      ),
                    ),
                  );
                },
              );
            }
            else {
              return Center(
                child:CircularProgressIndicator()
              );
            }
          },
        ),
    );
  }
}