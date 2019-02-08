import 'package:flutter/material.dart';
import 'package:flutter_playground/ui/app_theme.dart';
import 'package:flutter_playground/ui/player_search.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().theme,
      home: Scaffold(
        body: PlayerSearch(),
      ),
    );
  }
}