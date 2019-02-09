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
      ),
//      ),
    );
  }

}