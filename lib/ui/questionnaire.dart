
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';

class Questionnaire extends StatelessWidget {
  final Widget child;

  Questionnaire({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Container(
            height: 120,
            width: double.infinity,
            color: Colors.blue,
            child: BottomButtons(),
          )
        ],
      ),

    );
  }

  
}

class BottomButtons extends StatefulWidget {
    final Widget child;
  
    BottomButtons({Key key, this.child}) : super(key: key);
  
    BottomButtonsState createState() => BottomButtonsState();
  }
  
  class BottomButtonsState extends State<BottomButtons> {
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Fimber.i('Undo');
                    },
                    child: Text('Undo'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.purple,
                    textColor: Colors.white,
                    onPressed: () {
                      Fimber.i('pressed');
                    },
                    child: Text(
                      'Submit',
                    ),
                  ),
                ],
              )
            ],
        ),
      );
    }
  }
