class ApiConstants {
  // BASE URL
  // After you have entered/edited your base url, run the command:
  // flutter pub run build_runner build --delete-conflicting-outputs
  // to generate the api_services.g.dart file
  // Every time you change the base url, you need to run the above command
  static const String baseUrl = "http://157.173.110.155:81/api/";
  // static const String baseUrl = "https://base_project-api.mysoftware.pk/api/";

  static const String apiConnectionTest = "apiConnectionTest";

  //AUTHENTICATION APIS
  static const String login = "login";
  static const String register = "register";
  static const String forgotPassword = "forgot";
  static const String forgotOtpValidate = "forgot/validate";
  static const String newPassword = "newpassword";
  static const String changePassword = "changePassword";
  static const String logout = "logout";

  //PROFILE SCREEN APIS
  static const String getProfile = "profile";
  static const String getFaq = "faq";
  static const String getPrivacy = "privacy";
  static const String notification = "notification";
  static const String review = "review";

  static const String profileUpdate = "profile/update";
  static const String profilePictureUpdate = "profile/picture/update";
  static const String updatePassword = "profile/password/update";
  static const String notificationKey = "noti/setting";

  static const String home = "home";
  static const String searchReceiver = "searchReceiver";
  static const String requestForAcceptance = "requestForAcceptance";
  static const String journeyRequestAcceptOrReject =
      "journey/request-accept-or-reject";
  static const String searchBot = "search-bot";
  static const String deliverNow = "deliver-now";
  static const String confirmDelivery = "journey/confirmed-delivery";
  static const String inBound = "journey/in-bound";
  static const String outBound = "journey/out-bound";
  static const String orderDetail = "getJourneyById";
  static const String getJournyStatus = "journey/status/";
}
