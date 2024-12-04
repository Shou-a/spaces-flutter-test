import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class Typographies {
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      color: AppColors.bodyText,
      overflow: TextOverflow.ellipsis,
      height: 64 / 57,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      color: AppColors.bodyText,
      overflow: TextOverflow.ellipsis,
      height: 52 / 45,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      color: AppColors.bodyText,
      overflow: TextOverflow.ellipsis,
      height: 44 / 36,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: AppColors.bodyText,
      overflow: TextOverflow.ellipsis,
      height: 40 / 32,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: AppColors.bodyText,
      overflow: TextOverflow.ellipsis,
      height: 36 / 28,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColors.bodyText,
      overflow: TextOverflow.ellipsis,
      height: 32 / 24,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      color: AppColors.bodyText,
      overflow: TextOverflow.ellipsis,
      height: 28 / 22,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.bodyText,
      letterSpacing: 0.15,
      overflow: TextOverflow.ellipsis,
      height: 24 / 16,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.bodyText,
      letterSpacing: 0.1,
      overflow: TextOverflow.ellipsis,
      height: 20 / 14,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.bodyText,
      letterSpacing: 0.1,
      overflow: TextOverflow.ellipsis,
      height: 20 / 14,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.bodyText,
      letterSpacing: 0.5,
      overflow: TextOverflow.ellipsis,
      height: 16 / 12,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: AppColors.bodyText,
      letterSpacing: 0.5,
      overflow: TextOverflow.ellipsis,
      height: 16 / 11,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.bodyText,
      letterSpacing: 0.5,
      overflow: TextOverflow.ellipsis,
      height: 24 / 16,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.bodyText,
      letterSpacing: 0.25,
      overflow: TextOverflow.ellipsis,
      height: 20 / 14,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.bodyText,
      letterSpacing: 0.4,
      overflow: TextOverflow.ellipsis,
      height: 16 / 12,
    ),
  );
}

/// AppAmounts is a class that contains the amounts for multiple usage.
class Amount {
  /// Screen Horizontal Edge Margin
  static const double screenMargin = 16;
}

/// AppBorderRadius is a class that contains the border radius for buttons. xxsm, xsm, sm, md, lg, xl, and xxl are the sizes of the circular corner radius
class AppBorderRadius {
  /// 0px All Corners
  static const BorderRadius k00 = BorderRadius.zero;

  /// 2px All Corners
  static const BorderRadius k02 = BorderRadius.all(Radius.circular(2));

  /// 4px All Corners
  static const BorderRadius k04 = BorderRadius.all(Radius.circular(4));

  /// 6 px All Corners
  static const BorderRadius k06 = BorderRadius.all(Radius.circular(8));

  /// 8px All Corners
  static const BorderRadius k08 = BorderRadius.all(Radius.circular(8));

  /// 10px All Corners
  static const BorderRadius k10 = BorderRadius.all(Radius.circular(10));

  /// 12px All Corners
  static const BorderRadius k12 = BorderRadius.all(Radius.circular(12));

  /// 16px All Corners
  static const BorderRadius k16 = BorderRadius.all(Radius.circular(16));

  /// 24px All Corners
  static const BorderRadius k24 = BorderRadius.all(Radius.circular(24));

  /// 32px All Corners
  static const BorderRadius k32 = BorderRadius.all(Radius.circular(32));
}

/// AppButtonStyles is a class that contains the button styles for the app. filledLarge, filledMedium, filledSmall, outlinedLarge, outlinedMedium, outlinedSmall, and text are the button styles.
class AppButtonStyle {
  /// ButtonStyle for a filled button with large text
  static ButtonStyle filledLarge = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
    foregroundColor: MaterialStateProperty.all<Color>(AppColors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevation: MaterialStateProperty.all<double>(0),
    textStyle: MaterialStateProperty.all<TextStyle>(
      Typographies.textTheme.titleMedium!.copyWith(color: AppColors.white),
    ),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 24,
      ),
    ),
  );

  static final ButtonStyle filledLargeDark = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryDark,
    foregroundColor: AppColors.whiteDark,
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    shape: RoundedRectangleBorder(
      borderRadius: AppBorderRadius.k06,
    ),
  );

  /// ButtonStyle for filled medium buttons
  static ButtonStyle filledMedium = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
    foregroundColor: MaterialStateProperty.all<Color>(AppColors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevation: MaterialStateProperty.all<double>(0),
    textStyle: MaterialStateProperty.all<TextStyle>(
      Typographies.textTheme.bodyMedium!.copyWith(color: AppColors.white),
    ),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 24,
      ),
    ),
  );

  /// ButtonStyle for filled small buttons
  static ButtonStyle filledSmall = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
    foregroundColor: MaterialStateProperty.all<Color>(AppColors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevation: MaterialStateProperty.all<double>(0),
    textStyle: MaterialStateProperty.all<TextStyle>(
      Typographies.textTheme.bodySmall!.copyWith(color: AppColors.white),
    ),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 24,
      ),
    ),
  );

  /// ButtonStyle for outlined large buttons
  static ButtonStyle outlinedLarge = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColors.transparent),
    foregroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      const RoundedRectangleBorder(
        borderRadius: AppBorderRadius.k08,
        side: BorderSide(color: AppColors.stroke),
      ),
    ),
    elevation: MaterialStateProperty.all<double>(0),
    textStyle: MaterialStateProperty.all<TextStyle>(
      Typographies.textTheme.titleMedium!.copyWith(color: AppColors.primary),
    ),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 24,
      ),
    ),
  );

  /// ButtonStyle for outlined medium buttons
  static ButtonStyle outlinedMedium = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColors.transparent),
    foregroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      const RoundedRectangleBorder(
        borderRadius: AppBorderRadius.k08,
        side: BorderSide(color: AppColors.stroke),
      ),
    ),
    elevation: MaterialStateProperty.all<double>(0),
    textStyle: MaterialStateProperty.all<TextStyle>(
      Typographies.textTheme.bodyMedium!.copyWith(color: AppColors.primary),
    ),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 24,
      ),
    ),
  );

  /// ButtonStyle for outlined small buttons
  static ButtonStyle outlinedSmall = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColors.transparent),
    foregroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      const RoundedRectangleBorder(
        borderRadius: AppBorderRadius.k08,
        side: BorderSide(color: AppColors.stroke),
      ),
    ),
    elevation: MaterialStateProperty.all<double>(0),
    textStyle: MaterialStateProperty.all<TextStyle>(
      Typographies.textTheme.bodySmall!.copyWith(color: AppColors.primary),
    ),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 24,
      ),
    ),
  );

  /// ButtonStyle for text buttons
  static ButtonStyle textSmall = TextButton.styleFrom(
    foregroundColor: AppColors.primary,
    textStyle: Typographies.textTheme.bodySmall!.copyWith(
      color: AppColors.primary,
    ),
    padding: const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 8,
    ),
  );

  static final ButtonStyle textSmallDark = TextButton.styleFrom(
    foregroundColor: AppColors.primaryDark,
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 8),
  );

  static ButtonStyle textLarge = TextButton.styleFrom(
    foregroundColor: AppColors.primary,
    textStyle: Typographies.textTheme.bodyLarge!.copyWith(
      color: AppColors.primary,
    ),
    padding: const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 8,
    ),
  );
}

class AppInputDecoration {
  InputDecoration searchField = const InputDecoration();
}

class DrawerListTileThemeData {
  static ListTileThemeData inactive = ListTileThemeData(
    tileColor: AppColors.transparent,
    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
    // visualDensity: VisualDensity.compact,
    shape: const RoundedRectangleBorder(
      borderRadius: AppBorderRadius.k04,
    ),
    titleTextStyle: Typographies.textTheme.titleMedium!.copyWith(
      color: AppColors.subText,
    ),
    leadingAndTrailingTextStyle: Typographies.textTheme.titleMedium!.copyWith(
      color: AppColors.subText,
    ),
    iconColor: AppColors.icon,
  );

  static ListTileThemeData active = ListTileThemeData(
    tileColor: AppColors.primary50,
    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
    // visualDensity: VisualDensity.compact,
    shape: const RoundedRectangleBorder(
      borderRadius: AppBorderRadius.k04,
    ),
    titleTextStyle: Typographies.textTheme.titleMedium!.copyWith(
      color: AppColors.primary,
    ),
    leadingAndTrailingTextStyle: Typographies.textTheme.titleMedium!.copyWith(
      color: AppColors.primary,
    ),
    iconColor: AppColors.primary,
  );
}

/// CustomTheme is a class that contains the theme for the app
class CustomTheme {
  /// Light Theme for the app
  static ThemeData lightTheme = ThemeData(
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        modalBarrierColor: Colors.transparent),
    fontFamily: "Calibri",
    fontFamilyFallback: const <String>['poppins'],
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primary, // Set the cursor color
      selectionColor:
          AppColors.primary.withOpacity(0.5), // Set the selection color
      selectionHandleColor: AppColors.primary, // Set the handle color
    ),
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
      surface: AppColors.white,
      background: AppColors.background,
    ),
    drawerTheme: const DrawerThemeData(
      elevation: 0,
      backgroundColor: AppColors.white,
    ),
    textTheme: Typographies.textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppButtonStyle.filledLarge,
    ),
    textButtonTheme: TextButtonThemeData(
      style: AppButtonStyle.textSmall,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(AppColors.white),
      trackColor: MaterialStateProperty.all<Color>(AppColors.primary),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: Typographies.textTheme.bodyMedium!,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.stroke, width: 1),
          borderRadius: AppBorderRadius.k06),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.stroke, width: 1),
          borderRadius: AppBorderRadius.k06),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2),
        borderRadius: AppBorderRadius.k06,
      ),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: 1),
          borderRadius: AppBorderRadius.k06),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: 2),
          borderRadius: AppBorderRadius.k06),
      labelStyle:
          Typographies.textTheme.bodyMedium!.copyWith(color: AppColors.subText),
      floatingLabelStyle:
          Typographies.textTheme.bodyMedium!.copyWith(color: AppColors.primary),
      hintStyle:
          Typographies.textTheme.bodySmall!.copyWith(color: AppColors.subText),
      errorStyle:
          Typographies.textTheme.bodySmall!.copyWith(color: AppColors.error),
      helperStyle:
          Typographies.textTheme.bodySmall!.copyWith(color: AppColors.subText),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      errorMaxLines: 1.toInt(),
      iconColor: AppColors.primary,
      prefixIconColor: AppColors.icon,
      suffixIconColor: AppColors.icon,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(AppColors.primary),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.white,
      unselectedLabelColor: AppColors.subText,
      labelStyle: Typographies.textTheme.labelLarge,
      unselectedLabelStyle:
          Typographies.textTheme.labelLarge!.copyWith(color: AppColors.subText),
      indicator: const BoxDecoration(
        borderRadius: AppBorderRadius.k10,
        color: AppColors.primary,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      splashFactory: NoSplash.splashFactory,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
    ),
    listTileTheme: ListTileThemeData(
      tileColor: AppColors.transparent,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      // visualDensity: VisualDensity.compact,
      titleTextStyle: Typographies.textTheme.titleMedium!,
      subtitleTextStyle: Typographies.textTheme.bodyMedium!.copyWith(
        color: AppColors.subText,
      ),
      iconColor: AppColors.icon,
      leadingAndTrailingTextStyle: Typographies.textTheme.labelMedium!.copyWith(
        color: AppColors.subText,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.stroke,
      thickness: 1,
      indent: Amount.screenMargin,
      endIndent: Amount.screenMargin,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.k04),
      checkColor: MaterialStateProperty.all(AppColors.white),
      fillColor: MaterialStateProperty.all(AppColors.primary),
    ),
    appBarTheme: AppBarTheme(
        color: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: AppColors.icon,
          size: 24,
        ),
        actionsIconTheme: const IconThemeData(color: AppColors.icon),
        titleTextStyle: Typographies.textTheme.displaySmall!.copyWith(
          color: AppColors.accent,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
        )),
    scaffoldBackgroundColor: AppColors.background,
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.k16),
      actionsPadding: EdgeInsets.symmetric(horizontal: 50),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        modalBarrierColor: Colors.black54),
    fontFamily: "Calibri",
    fontFamilyFallback: const <String>['poppins'],
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryDark, // Adjust for dark mode
      selectionColor: AppColors.primaryDark.withOpacity(0.5),
      selectionHandleColor: AppColors.primaryDark,
    ),
    primaryColor: AppColors.primaryDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondaryDark,
      error: AppColors.errorDark,
      surface: AppColors.surfaceDark,
      background: AppColors.backgroundDark,
    ),
    drawerTheme: const DrawerThemeData(
      elevation: 0,
      backgroundColor: AppColors.surfaceDark,
    ),
    textTheme: Typographies.textTheme, // Same text theme, or customize for dark
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppButtonStyle.filledLargeDark, // Dark-specific button style
    ),
    textButtonTheme: TextButtonThemeData(
      style: AppButtonStyle.textSmallDark,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(AppColors.surfaceDark),
      trackColor: MaterialStateProperty.all<Color>(AppColors.primaryDark),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: Typographies.textTheme.bodyMedium!,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.strokeDark, width: 1),
          borderRadius: AppBorderRadius.k06),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.strokeDark, width: 1),
          borderRadius: AppBorderRadius.k06),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryDark, width: 2),
        borderRadius: AppBorderRadius.k06,
      ),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorDark, width: 1),
          borderRadius: AppBorderRadius.k06),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorDark, width: 2),
          borderRadius: AppBorderRadius.k06),
      labelStyle: Typographies.textTheme.bodyMedium!
          .copyWith(color: AppColors.subTextDark),
      floatingLabelStyle: Typographies.textTheme.bodyMedium!
          .copyWith(color: AppColors.primaryDark),
      hintStyle: Typographies.textTheme.bodySmall!
          .copyWith(color: AppColors.subTextDark),
      errorStyle: Typographies.textTheme.bodySmall!
          .copyWith(color: AppColors.errorDark),
      helperStyle: Typographies.textTheme.bodySmall!
          .copyWith(color: AppColors.subTextDark),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      errorMaxLines: 1.toInt(),
      iconColor: AppColors.primaryDark,
      prefixIconColor: AppColors.iconDark,
      suffixIconColor: AppColors.iconDark,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(AppColors.primaryDark),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.surfaceDark,
      unselectedLabelColor: AppColors.subTextDark,
      labelStyle: Typographies.textTheme.labelLarge,
      unselectedLabelStyle: Typographies.textTheme.labelLarge!
          .copyWith(color: AppColors.subTextDark),
      indicator: const BoxDecoration(
        borderRadius: AppBorderRadius.k10,
        color: AppColors.primaryDark,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      splashFactory: NoSplash.splashFactory,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.surfaceDark,
    ),
    listTileTheme: ListTileThemeData(
      tileColor: AppColors.transparent,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      titleTextStyle: Typographies.textTheme.titleMedium!,
      subtitleTextStyle: Typographies.textTheme.bodyMedium!.copyWith(
        color: AppColors.subTextDark,
      ),
      iconColor: AppColors.iconDark,
      leadingAndTrailingTextStyle: Typographies.textTheme.labelMedium!.copyWith(
        color: AppColors.subTextDark,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.strokeDark,
      thickness: 1,
      indent: Amount.screenMargin,
      endIndent: Amount.screenMargin,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.k04),
      checkColor: MaterialStateProperty.all(AppColors.surfaceDark),
      fillColor: MaterialStateProperty.all(AppColors.primaryDark),
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: AppColors.iconDark,
        size: 24,
      ),
      actionsIconTheme: const IconThemeData(color: AppColors.iconDark),
      titleTextStyle: Typographies.textTheme.displaySmall!.copyWith(
        color: AppColors.accentDark,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    dialogTheme: const DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.k16),
      actionsPadding: EdgeInsets.symmetric(horizontal: 50),
    ),
  );
}
