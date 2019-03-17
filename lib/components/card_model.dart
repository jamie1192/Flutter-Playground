import 'package:flutter/material.dart';

class CardModel {

  Card createCard(
    BuildContext context,
    String title,
    Color cardColor,
    double cardWidth,
    Function swipeLeft,
    Function swipeRight) {

      Size screenSize = MediaQuery.of(context).size;

      return new Card(
        color: Colors.transparent,
        elevation: 4.0,
        child: new Container(                      
          width: screenSize.width / 1.2 + cardWidth,
          height: screenSize.height / 1.7,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.circular(8.0),
          ),
          child: new Column(
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  new Container(
                    width: screenSize.width / 1.2 + cardWidth,
                    height: screenSize.height / 2.2,
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.only(
                          topLeft: new Radius.circular(8.0),
                          topRight: new Radius.circular(8.0)),
                      color: cardColor,
                    ),
                  ),
                  Text(title,
                    style: TextStyle(
                      fontSize: 20.0
                    ),
                  )
                ],
              ),
              
              new Container(
                  width: screenSize.width / 1.2 + cardWidth,
                  height: screenSize.height / 1.7 -
                      screenSize.height / 2.2,
                
                  child: new Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        child: Text("NUH"),
                        onPressed: swipeLeft,
                      ),
                      FlatButton(
                        child: Text("YUH"),
                        onPressed: swipeRight,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      );
  }

}