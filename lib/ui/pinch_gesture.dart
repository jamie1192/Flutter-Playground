import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';

class PinchGesture extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pinch Gestures'),
        backgroundColor: Colors.cyan,
      ),
      body: _PinchImage(),
    );
  }

}


class _PinchImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PinchImageState();
}

class _PinchImageState extends State<_PinchImage> {

  double constSize = 250.0;
  double dynamicSize = 250.0;

  double constFont = 20.0;
  double dynamicFontSize = 20.0;

  double constTop = 80.0;
  double dynamicTop = 80.0;
  double constLeft = 90.0;
  double dynamicLeft = 90.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onScaleUpdate: (newScale) {

            Fimber.i('scale: ${newScale.scale}');
            double tempScale = newScale.scale;

            double tempSize = constSize * tempScale;
            double tempFont = constFont * tempScale;

            double tempLeft = constLeft * tempScale;
            double tempTop = constTop * tempScale;
            Fimber.i('temp: $tempScale, tempSize: $tempSize');

            if (tempSize >= 50.0 && tempSize <= 400.0) {
              setState(() {
                Fimber.i('size: $tempScale');
                dynamicSize = tempSize;
                dynamicFontSize = tempFont;
                dynamicTop = tempTop;
                dynamicLeft = tempLeft;
              });
            }

          },
          onScaleEnd: (scaleEnd) {
            Fimber.i('dynamicSize: $dynamicSize');
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: Center(
              child: Stack(
                alignment: FractionalOffset.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/icon_cloud.png'),
                    width: dynamicSize,
                    height: dynamicSize,
                  ),
                  Positioned(
                    top: dynamicTop,
                    left: dynamicLeft,
                    child: Text(
                        'Cloud Text',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: dynamicFontSize,
                        fontFamily: 'Children-One'
                      ),
                    )
                  )
                ],
              )
            ),
          ),
    );
  }

}
