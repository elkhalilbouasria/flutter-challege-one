import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class ThemeChangerProvider with ChangeNotifier{
     ThemeData _themeData;
     ThemeChangerProvider(this._themeData);
     getTheme() => _themeData;
     setTheme(ThemeData themeData){
        _themeData = themeData;
        notifyListeners();
     }
}


