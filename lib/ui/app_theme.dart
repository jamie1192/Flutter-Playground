import 'package:flutter/material.dart';

class AppTheme  {



  Color _primary = Colors.deepOrange;
  Color _accent = Colors.orangeAccent;

  ThemeData _data  = new ThemeData(
    primaryColor: Colors.deepOrange,
    accentColor: Colors.orangeAccent,

  );

  get theme => _data;
  get primaryColor => _primary;
  get accentColor => _accent;


}