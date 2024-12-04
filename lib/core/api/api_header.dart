import 'package:dio/dio.dart';

import '../utils/preferences_names.dart';
import '../utils/shared_preferences.dart';

class ApiHeader {
  Dio dioData() {
    final dio = Dio();
    dio.options.headers["Accept"] =
        "application/json"; // Config your dio headers globally
    dio.options.headers["timezone"] =
        DateTime.now().timeZoneName; // Config your dio headers globally
    dio.options.headers["Authorization"] =
        "Bearer ${SharedPreferenceHelper.getString(PreferencesNames.authToken)}";
    dio.options.followRedirects = false;
    dio.options.connectTimeout = const Duration(seconds: 120); //5ss
    dio.options.receiveTimeout = const Duration(seconds: 120);
    return dio;
  }
}
