import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

void main() {
  Fimber.plantTree(DebugTree());
  runApp(App());
}