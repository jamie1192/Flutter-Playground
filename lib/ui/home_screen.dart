import 'package:flutter/material.dart';
import 'package:flutter_playground/ui/app_theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
            ListTile(
              title: Text('Destiny API Search'),
              leading: Icon(
                  MdiIcons.gamepad
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, 'playerSearch');
              },
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
                    MdiIcons.loop
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, 'spinnerWheel');
                  }
                ),
                ListTile(
                    title: Text('Pinching'),
                    leading: Icon(
                        MdiIcons.gesturePinch
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, 'pinchGesture');
                    }
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Storage'),
            ),
            ListTile(
                title: Text('Database'),
                leading: Icon(
                    MdiIcons.database
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, 'crudScreen');
                }
            )
          ],
        ),
      ),
    );
  }

}