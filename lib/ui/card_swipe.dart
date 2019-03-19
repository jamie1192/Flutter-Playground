
import 'dart:async';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/components/card_model.dart';

class CardSwipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Swipe'),
      ),
      body: Container(
        child: CardActivity(),
      ),
    );
  }
}

class CardActivity extends StatefulWidget {

  @override
  _CardActivityState createState() => _CardActivityState();
}

class _CardActivityState extends State<CardActivity> with TickerProviderStateMixin {

  AnimationController _animationController;
  Animation<double> rotate;
  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;
  
  List data = [];

  @override
  void initState() { 
    super.initState();
    data = ['First Card', 'Second Card', 'Third Card', 'Fourth card', 'Fifth card'];  
    _animationController = new AnimationController(
      duration: new Duration(milliseconds: 1000), vsync: this);
    
    rotate = new Tween<double>(
      begin: -0.0,
      end: -40.0
    ).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease
      ),
    );
    right = new Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );
    bottom = new Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );
    width = new Tween<double>(
      begin: 20.0,
      end: 25.0,
    ).animate(
      new CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
      ),
    );
    rotate.addListener(() {
      // setState(() {
        if (rotate.isCompleted) {
          // data
        }
      // });
    });
  }

  Future<Null> _swipeAnimation() async {
    try {
      //run the animation from start to end points
      await _animationController.forward();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {

    swipeLeft() {
      Fimber.i("LEFT SWIPE");
    }
    swipeRight() {
       Fimber.i("SWIPE RIGHT");
      _swipeAnimation();
    }

    var dataLength = data.length;
    double initialBottom = 15.0;
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
    double backCardWidth = -10.0;
    
    return Column(
      children: <Widget> [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Reset Stack'),
              onPressed: () {
                setState(() {
                  Fimber.i("STATE RESET");
                  data = ['First Card', 'Second Card', 'Third Card', 'Fourth card', 'Fifth card'];  
                });
              },
            ),
            RaisedButton(
              child: Text('Randomise'),
              onPressed: () {
                setState(() {
                  Fimber.i("RANDOMISED");
                  data.shuffle();  
                });
              },
            )
          ],
        ),
        Container(
          alignment: Alignment.center,
          child: new Stack(
            alignment: AlignmentDirectional.center,
            children: data.map((item) {
                backCardPosition = backCardPosition - 10;
                backCardWidth = backCardWidth + 10;

                return Dismissible(
                  key: new ValueKey(item),
                  child: CardModel().createCard(
                    context,
                    item,
                    Colors.red[data.indexOf(item) * 50],
                    backCardWidth + 10,
                    swipeLeft,
                    swipeRight
                  ),
                  onDismissed: (DismissDirection direction) {
                    Fimber.i(direction.toString());
                    setState(() {
                      data.remove(item);  
                    });
                  },
                );
            }).toList()
          ),
        )
      ]
    );
  }

}