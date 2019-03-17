
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

class _CardActivityState extends State<CardActivity> {
  
  @override
  Widget build(BuildContext context) {

    swipeLeft() => Fimber.i("LEFT SWIPE");
    swipeRight() => Fimber.i("SWIPE RIGHT");

    List data = ['First Card', 'Second Card', 'Third Card'];
    var dataLength = data.length;
    double initialBottom = 15.0;
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
    double backCardWidth = -10.0;

    
    // List<Card> cardList = [
    //   CardModel().createCard(
    //     context,
    //     "First card",
    //     Colors.yellow,
    //     back
    //     swipeLeft,
    //     swipeRight
    //   ),
    //   CardModel().createCard(
    //     context,
    //     "Second card",
    //     Colors.blue,
    //     swipeLeft,
    //     swipeRight
    //   ),
    //   CardModel().createCard(
    //     context,
    //     "Third card",
    //     Colors.red,
    //     swipeLeft,
    //     swipeRight
    //   ),
    // ];

    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Container(
        alignment: Alignment.topCenter,
        child: new Stack(
          alignment: AlignmentDirectional.center,
          children: data.map((item) {
            if(data.indexOf(item) == data.length -1) {
              return Draggable(
                child: CardModel().createCard(
                  context,
                  item,
                  Colors.red[data.indexOf(item) * 50],
                  backCardWidth + 10,
                  swipeLeft,
                  swipeRight
                ),
                feedback: CardModel().createCard(
                    context,
                    item,
                    Colors.red[data.indexOf(item) * 50],
                    backCardWidth + 10,
                    swipeLeft,
                    swipeRight
                ),
                childWhenDragging: Container(),
              );
            } else {
              backCardPosition = backCardPosition - 10;
              backCardWidth = backCardWidth + 10;

              return Draggable(
                child: CardModel().createCard(
                  context,
                  item,
                  Colors.red[data.indexOf(item) * 50],
                  backCardWidth + 10,
                  swipeLeft,
                  swipeRight
                ),
                feedback: CardModel().createCard(
                  context,
                  item,
                  Colors.red[data.indexOf(item) * 50],
                  backCardWidth + 10,
                  swipeLeft,
                  swipeRight
                ),
                childWhenDragging: Container(),
              );
            }
          }).toList()
        ),
      ),
    );
  }

}