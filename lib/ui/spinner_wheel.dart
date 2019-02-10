import 'package:flutter/material.dart';

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

     ),
    );
  }

}