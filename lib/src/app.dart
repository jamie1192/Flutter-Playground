import 'package:flutter/material.dart';
import 'package:flutter_playground/ui/app_theme.dart';
import 'package:flutter_playground/ui/character_search.dart';
import 'package:flutter_playground/ui/crud_screen.dart';
import 'package:flutter_playground/ui/home_screen.dart';
import 'package:flutter_playground/ui/pinch_gesture.dart';
import 'package:flutter_playground/ui/player_search.dart';
import 'package:flutter_playground/ui/spinner_wheel.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().theme,
      initialRoute: '/',
      routes: {
//        '/' : (context) => HomeScreen(),
        'playerSearch': (context) => PlayerSearch(),
        'characterSearch': (context) => CharacterSearch(),
        'spinnerWheel': (context) => SpinnerWheel(),
        'pinchGesture': (context) => PinchGesture(),
        'crudScreen': (context) => CrudScreen()
      },
      home: HomeScreen(title: 'Flutter Playground'),
    );
  }
}