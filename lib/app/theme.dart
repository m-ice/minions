import 'package:flutter/material.dart';

class AppTheme {
  /// 主色
  static const Color primaryColor = Color(0xFF1976D2);

  /// 次要色
  static const Color secondaryColor = Color(0xFF42A5F5);

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
  static final ButtonStyle baseButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: defaultRadius),
  );

  /// 通用输入框样式
  static InputDecorationTheme baseInputDecorationTheme(Color borderColor, Color focusedColor) {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: borderColor, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: BorderSide(color: focusedColor, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: const BorderSide(color: errorColor, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: defaultRadius,
        borderSide: const BorderSide(color: errorColor, width: 2.0),
      ),
    );
  }

  /// 亮色主题
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: baseTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(style: baseButtonStyle),
    inputDecorationTheme: baseInputDecorationTheme(Colors.blue, Colors.blue),
  );

  /// 暗色主题
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: baseTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(style: baseButtonStyle),
    inputDecorationTheme: baseInputDecorationTheme(Colors.blueGrey, Colors.lightBlueAccent),
  );
}
