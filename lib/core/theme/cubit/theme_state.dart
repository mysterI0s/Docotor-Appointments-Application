import 'package:flutter/material.dart';

abstract class ThemeState {
  get themeData => null;
}

class ThemeInitial extends ThemeState {
  @override
  final ThemeData themeData;

  ThemeInitial(this.themeData);
}

class ThemeChanged extends ThemeState {
  @override
  final ThemeData themeData;

  ThemeChanged(this.themeData);
}
