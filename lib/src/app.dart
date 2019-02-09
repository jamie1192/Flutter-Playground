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
      home: HomeScreen(),
    );
  }
}