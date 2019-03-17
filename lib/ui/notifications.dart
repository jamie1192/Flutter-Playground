import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_playground/ui/notification_data.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.indigo,
      ),
      body: ButtonContainer(),
    );
  }
}

class ButtonContainer extends StatefulWidget {
  @override
  _ButtonContainerState createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      Fimber.d('notification payload: ' + payload);
    }

    await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new NotificationData(payload)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.indigoAccent,
                onPressed: instantNotification,
                child: Text('Instant Notification',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.indigoAccent,
                onPressed: scheduledNotification,
                child: Text('Schedule Notification (7 seconds)',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.indigoAccent,
                onPressed: periodic,
                child: Text('Periodic intervals (1 min)',
                  style: TextStyle(
                      color: Colors.white
                    ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.indigoAccent,
                onPressed: cancelAllPending,
                child: Text('Cancel all scheduled notifications',
                  style: TextStyle(
                      color: Colors.white
                    ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  instantNotification() async {
    var android = AndroidNotificationDetails(
            '1', 'Instant channel', 'Instant notification testing',
            importance:Importance.Max, priority: Priority.High);

    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android, iOS);
    
    await flutterLocalNotificationsPlugin.show(0, 'Title ', 'Body', platform, payload: 'This is the instant payload data 😎');
  }

  scheduledNotification() async {
    var android = AndroidNotificationDetails(
            '2', 'Scheduled Notifications', 'Scheduled Notification testing');

    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android, iOS);
    var scheduledNotificationDateTime =
        new DateTime.now().add(Duration(seconds: 7));

    await flutterLocalNotificationsPlugin.schedule(
      0, 'Scheduled Notification ', '7 Seconds', 
      scheduledNotificationDateTime, platform, payload: 'This is the scheduled payload data 😎');
  }

  periodic() async {
    // Show a notification every minute with the first appearance happening a minute after invoking the method
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        '3', 'Periodic Notificatons', 'Every {x} minutes');

    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.periodicallyShow(0, 'Periodic Notification',
        'Periodic body', RepeatInterval.EveryMinute, platformChannelSpecifics,
        payload: 'This is the periodic payload data 😎');
  }


  specifiedTime() async {
    var time = new Time(10, 0, 0);
    var androidPlatformChannelSpecifics =
    new AndroidNotificationDetails('repeatDailyAtTime channel id',
        'repeatDailyAtTime channel name', 'repeatDailyAtTime description');
    
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'show daily title',
      'Daily notification shown at approximately ${_toTwoDigitString(time.hour)}:${_toTwoDigitString(time.minute)}:${_toTwoDigitString(time.second)}',
            time,
            platformChannelSpecifics
          );
        }
      
        cancelAllPending() async {
          await flutterLocalNotificationsPlugin.cancelAll();
        }
      
        _toTwoDigitString(int minute) => minute.toString();
        
}

