import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class SpinnerWheel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spinning Wheel'),
        backgroundColor: Color.fromARGB(255, 100, 186, 97),
      ),
      body: _WheelWidget(),
    );
  }

}

class _WheelWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WheelWidgetState();
  }

}

class _WheelWidgetState extends State<_WheelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
     height: double.infinity,
     width: double.infinity,
     child: Center(
      child: TransformContainer()
     ),
    );
  }

}

class TransformContainer extends StatefulWidget {
  const TransformContainer({
    Key key,
  }) : super(key: key);

  @override
  TransformContainerState createState() {
    return new TransformContainerState();
  }
}

class TransformContainerState extends State<TransformContainer> {
  double initialAngle = 0;
  double startAngle = 0;
  double width, height;
  double prevX, prevY;
  double currX, currY;
  double prevRotation = 0;
  double currRotation = 0;
  Matrix4 matrix = Matrix4.identity();
  GlobalKey _circleKey = GlobalKey();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_getDimens);
  }

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback(_getDimens);

    return Stack(
      children: <Widget>[

          Container(
            color: Colors.black54,
            key: _circleKey,
            child: Transform.rotate(
              angle: 0,
              alignment: FractionalOffset.center,
              child: Center(
                child: GestureDetector(
                  onPanStart: (details) {

                    prevX = details.globalPosition.dx - (width / 2);
                    prevY = details.globalPosition.dy - (height / 2);
                    initialAngle = math.atan2(prevY, prevX);
                    startAngle = math.atan2(prevY, prevX);
                    prevRotation = currRotation;
                    Fimber.i('prevX: $prevX, prevY: $prevY, startAngle: $startAngle');
                    //TODO: get starting touch pos and save above as class var
                    matrix.translate(-details.globalPosition.dx, -details.globalPosition.dy);
                    Fimber.i('x: ${-details.globalPosition.dx} y:${-details.globalPosition.dy}');
                    //matrix.rotateZ(0.174533);
                    matrix.rotateZ(0);
                    matrix.translate(details.globalPosition.dx, details.globalPosition.dy);
//                    setState(() {});
                  },
                  onPanUpdate: (pos) {
                    currX = pos.globalPosition.dx;
                    currY = pos.globalPosition.dy;
                    double rads = math.atan2(currY, currX);

                    Fimber.i('one: $currRotation');
                    currRotation += ((rads - startAngle) * (180 / math.pi));
                    Fimber.i('two: $currRotation');
                    prevX = pos.globalPosition.dx - (width / 2);
                    prevY = pos.globalPosition.dy - (height / 2);
                    startAngle = rads;

                    if(currRotation > 180) {
                      currRotation-= 360;
                    }
                    else if(currRotation < -180) {
                      currRotation+= 360;
                    }

                    setState(() {});
//                    rotation(currRotation, 1);

                    Fimber.i('currentRotation: $currRotation');
                  },
//                  onPanCancel: () {
//                    //get last
//                  },
                  onDoubleTap: () {
                    setState(() {
                      matrix = Matrix4.identity();
                    });
                  },
                  child: Container(
                    width: 320,
                    height: 320,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),
          ),
//        ),
        Positioned(
          top: 10.0,
          right: 10.0,
          child: Container(
            color: Colors.pinkAccent,
            child: IconButton(
              icon: Icon(Icons.refresh),
              iconSize: 50.0,
              color: Colors.white,
              onPressed: () {
                setState(() {
                  matrix = Matrix4.identity();
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  _getDimens(_) {
    final RenderBox renderBoxCircle = _circleKey.currentContext.findRenderObject();
    width = renderBoxCircle.size.width;
    height = renderBoxCircle.size.height;
//    Fimber.i('height: ${renderBoxCircle.size}, width: ${renderBoxCircle.size.width}');
  }

}

double rotation(double x, double y) {

}