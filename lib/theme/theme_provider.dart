import 'package:flutter/material.dart';
import 'package:music_player/theme/dark.theme.dart';
import 'package:music_player/theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {

  // initially, light mode

  ThemeData _themeData = lightMode;


  // get theme data

  ThemeData get themeData => _themeData;

  // is dark mode

  bool get isDarkMode => _themeData == darkMode;


  // set theme

  set themeData(ThemeData themeData){
    _themeData = themeData;

    // update UI

    notifyListeners();
  }

  // toogle theme

  void toogleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
    }
    else{
      themeData = lightMode;
    }
  }
}