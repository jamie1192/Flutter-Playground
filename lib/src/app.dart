import 'package:flutter/material.dart';
import 'package:flutter_playground/ui/app_theme.dart';
import 'package:flutter_playground/ui/character_search.dart';
import 'package:flutter_playground/ui/home_screen.dart';
import 'package:flutter_playground/ui/player_search.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().theme,
      initialRoute: '/',
      routes: {
//        '/' : (context) => HomeScreen(),
        'playerSearch': (context) => PlayerSearch(),
        'characterSearch': (context) => CharacterSearch()
      },
      home: Scaffold(
//        body: PlayerSearch(),
        appBar: AppBar(
          title: Text('Flutter Playground'),
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
                  Navigator.pushNamed(context, 'playerSearch');
//                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Destiny Character List'),
                leading: Icon(Icons.people),
                onTap: () {
                  Navigator.pushNamed(context, 'characterSearch');
//                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}