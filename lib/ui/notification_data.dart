import 'package:flutter/material.dart';

class NotificationData extends StatelessWidget {

  final String payload;

  NotificationData(this.payload);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Data'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: Center(
          child: Text(payload)
        ),
      )
    );
  }
}