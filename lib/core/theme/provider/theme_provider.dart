import 'package:flutter/foundation.dart';
import '../../utils/app_consts.dart';
import '../../utils/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    _loadCurrentTheme();
  }

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    SharedPreferenceHelper.setBoolean(AppConst.theme, _darkTheme);
    notifyListeners();
  }

  void _loadCurrentTheme() async {
    _darkTheme = SharedPreferenceHelper.getBoolean(AppConst.theme, def: false)!;
    notifyListeners();
  }
}
