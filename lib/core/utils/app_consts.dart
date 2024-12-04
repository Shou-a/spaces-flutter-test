import '../localization/app_localizations/models/language_model.dart';

class AppConst {
  ///login screen
  static const String theme = "theme";

  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: '',
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: '',
        languageName: 'Arabic',
        countryCode: 'IQ',
        languageCode: 'ar'),
    LanguageModel(
        imageUrl: '',
        languageName: 'Kurdish',
        countryCode: 'AE',
        languageCode: 'ku'),
  ];
}
