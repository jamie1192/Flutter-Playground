import 'package:flutter/material.dart';
import 'package:flutter_playground/ui/app_theme.dart';

class HomeScreen extends StatelessWidget {

  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(
          //important, must apparently remove any padding
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Flutter Playground'),
              decoration: BoxDecoration(
                color: AppTheme().primaryColor
              )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Networking'),
            ),
            ExpansionTile(
              leading: Icon(
                Icons.gamepad
              ),
              title: Text('Destiny API'),
              children: <Widget>[
                ListTile(
                  title: Text('Destiny Player Search'),
                  leading: Icon(
                    Icons.search
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, 'playerSearch');
                  },
                ),
                ListTile(
                  title: Text('Destiny Character List'),
                  leading: Icon(Icons.people),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, 'characterSearch');
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Activities'),
            ),
            ExpansionTile(
              leading: Icon(
                Icons.touch_app
              ),
              title: Text('UI'),
              children: <Widget>[
                ListTile(
                  title: Text('Wheel'),
                  leading: Icon(
                    Icons.av_timer
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, 'spinnerWheel');
                  }
                ),
                ListTile(
                    title: Text('Pinching'),
                    leading: Icon(
                        Icons.aspect_ratio
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, 'pinchGesture');
                    }
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}