import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/scheduler/ticker.dart';

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
  double angle = 0;
  Matrix4 matrix = Matrix4.identity();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTapDown: (details) {
            //TODO: get starting touch pos and save above as class var
            matrix.translate(-details.globalPosition.dx, -details.globalPosition.dy);
            Fimber.i('x: ${-details.globalPosition.dx} y:${-details.globalPosition.dy}');
//            matrix.rotateZ(0.174533);
            matrix.rotateZ(0.10);
            matrix.translate(details.globalPosition.dx, details.globalPosition.dy);
            setState(() {});
          },
          onPanUpdate: (pos) {
            Fimber.i('x: ${-pos.globalPosition.dx} y:${-pos.globalPosition.dy}');
          },
          onDoubleTap: () {
            setState(() {
              matrix = Matrix4.identity();
            });
          },
          child: Container(
            color: Colors.black54,
            child: Transform.rotate(
              angle: angle += 10,
              alignment: FractionalOffset.center,

                child: Center(
                  child: Container(
                    width: 320,
                    height: 320,
                    color: Colors.redAccent,
                  ),
                ),
              ),
          ),
        ),
        Positioned(
          top: 64.0,
          right: 64.0,
          child: Container(
            color: Colors.pinkAccent,
            child: IconButton(
              icon: Icon(Icons.refresh),
              iconSize: 72.0,
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
}