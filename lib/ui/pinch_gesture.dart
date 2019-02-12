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

  double size = 200.0;
  double temp = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onScaleUpdate: (newScale) {

              Fimber.i('scale: ${newScale.scale}');
              double tempScale = newScale.scale * 10;

              double tempSize = size + tempScale;
              Fimber.i('temp: $tempScale, tempSize: $tempSize');
//              if (newScale.scale < 1.5 && newScale.scale >= 0.25) {
              if (tempSize >= 50.0 && newScale.scale <= 350.0) {
                setState(() {
//                  double val = size * newScale.scale;
                  Fimber.i('size: $tempScale');
                  size = tempSize;
                });

              }
//              if (newScale.scale >= 30 && newScale.scale <= 500) {

//            }
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child:  Image(
                image: AssetImage('assets/images/icon_cloud.png'),
                width: size,
                height: size,
          ),
        ),
      ),
    );
  }

}
