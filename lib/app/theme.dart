import 'package:flutter/material.dart';

class AppTheme {
  /// 主色
  static const Color lightPrimaryColor = Color(0xFF1976D2);
  static const Color darkPrimaryColor = Colors.pinkAccent;

  /// 次要色
  static const Color lightSecondaryColor = Color(0xFF42A5F5);
  static const Color darkSecondaryColor = Color(0xFF00FFF5);

  /// 错误色
  static const Color errorColor = Color(0xFFD32F2F);

  /// 全局圆角
  static const BorderRadius defaultRadius = BorderRadius.all(Radius.circular(12));

  /// 通用文字样式
  static const TextTheme baseTextTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 16),
  );

  /// 通用按钮样式
  static final ButtonStyle lightBaseButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: lightPrimaryColor,
    foregroundColor: Colors.white,
    shape: const RoundedRectangleBorder(borderRadius: defaultRadius),
  );

  static final ButtonStyle darkBaseButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: darkPrimaryColor,
    foregroundColor: Colors.white,
    shape: const RoundedRectangleBorder(borderRadius: defaultRadius),
  );

  /// 通用输入框样式
  static InputDecorationTheme baseInputDecorationTheme(Color borderColor, Color focusedColor) {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: borderColor, width: 1.5),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: focusedColor, width: 2.0),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: errorColor, width: 1.5),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: errorColor, width: 2.0),
      ),
    );
  }

  /// 亮色主题
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    colorScheme: const ColorScheme.light(
      primary: lightPrimaryColor,
      secondary: lightSecondaryColor,
      error: errorColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: lightPrimaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: baseTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(style: lightBaseButtonStyle),
    inputDecorationTheme: baseInputDecorationTheme(Colors.blue, Colors.blue),
  );

  /// 暗色主题
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    colorScheme: const ColorScheme.dark(
      primary: darkPrimaryColor,
      secondary: darkSecondaryColor,
      error: errorColor,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkPrimaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: baseTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(style: darkBaseButtonStyle),
    inputDecorationTheme: baseInputDecorationTheme(Colors.blueGrey, Colors.lightBlueAccent),
  );
}
