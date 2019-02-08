import 'package:flutter/material.dart';

class AppTheme  {

  ThemeData _data  = new ThemeData(
    primaryColor: Colors.deepOrange,
    accentColor: Colors.orangeAccent,

  );

  get theme => _data;
}