import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theme_service.g.dart';

class EggThemeLight {
  final BorderRadius borderRadius = BorderRadius.circular(8);

  static const double fontSize = 16;
  static const double fontHeight = 1.30;

  final fallback = ThemeData.light();
  ThemeData get light {
    return ThemeData(
      // primarySwatch: const MaterialColor(0xFF7c2250, <int, Color>{
      //   50: Color(0xffce5641), //10%
      //   100: Color(0xffb74c3a), //20%
      //   200: Color(0xffa04332), //30%
      //   300: Color(0xff89392b), //40%
      //   400: Color(0xff733024), //50%
      //   500: Color(0xff5c261d), //60%
      //   600: Color(0xff451c16), //70%
      //   700: Color(0xff2e130e), //80%
      //   800: Color(0xff170907), //90%
      //   900: Color(0xff000000), //100%
      // }),
      fontFamily: 'AtkinsonHyperlegible',
      primaryColor: Colors.amber,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF9B3C6A),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFFFD9E5),
        onPrimaryContainer: Color(0xFF3D0023),
        secondary: Color(0xFF735761),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFFFD9E5),
        onSecondaryContainer: Color(0xFF2A151E),
        tertiary: Color(0xFF7E5537),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFFFDCC5),
        onTertiaryContainer: Color(0xFF301400),
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        background: Color(0xFFFFFBFF), //0xFFFFFBFF
        onBackground: Color(0xFF201A1C),
        surface: Color(0xFFFFFBFF),
        onSurface: Color(0xFF201A1C),
        surfaceVariant: Color(0xFFF1DEE3),
        onSurfaceVariant: Color(0xFF514348),
        outline: Color(0xFF837378),
        onInverseSurface: Color(0xFFFAEEF0),
        inverseSurface: Color(0xFF352F31),
        inversePrimary: Color(0xFFFFB0CF),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF9B3C6A),
      ),
      useMaterial3: true,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: fontSize, height: fontHeight),
      ),
    );
  }

  ThemeData get dark {
    return ThemeData(
      // primarySwatch: const MaterialColor(0xFF7c2250, <int, Color>{
      //   50: Color(0xffce5641), //10%
      //   100: Color(0xffb74c3a), //20%
      //   200: Color(0xffa04332), //30%
      //   300: Color(0xff89392b), //40%
      //   400: Color(0xff733024), //50%
      //   500: Color(0xff5c261d), //60%
      //   600: Color(0xff451c16), //70%
      //   700: Color(0xff2e130e), //80%
      //   800: Color(0xff170907), //90%
      //   900: Color(0xff000000), //100%
      // }),
      fontFamily: 'AtkinsonHyperlegible',
      primaryColor: Colors.amber,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFFFB0CF),
        onPrimary: Color(0xFF60083A),
        primaryContainer: Color(0xFF7E2351),
        onPrimaryContainer: Color(0xFFFFD9E5),
        secondary: Color(0xFFE1BDC9),
        onSecondary: Color(0xFF412A33),
        secondaryContainer: Color(0xFF5A3F49),
        onSecondaryContainer: Color(0xFFFFD9E5),
        tertiary: Color(0xFFF1BC97),
        onTertiary: Color(0xFF49280E),
        tertiaryContainer: Color(0xFF633E22),
        onTertiaryContainer: Color(0xFFFFDCC5),
        error: Color(0xFFFFB4AB),
        errorContainer: Color(0xFF93000A),
        onError: Color(0xFF690005),
        onErrorContainer: Color(0xFFFFDAD6),
        background: Color(0xFF181315), //0xFF201A1C
        onBackground: Color(0xFFEBE0E2),
        surface: Color(0xFF201A1C),
        onSurface: Color(0xFFEBE0E2),
        surfaceVariant: Color(0xFF514348),
        onSurfaceVariant: Color(0xFFD5C2C7),
        outline: Color(0xFF9D8C91),
        onInverseSurface: Color(0xFF201A1C),
        inverseSurface: Color(0xFFEBE0E2),
        inversePrimary: Color(0xFF9B3C6A),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFFFFB0CF),
      ),
      useMaterial3: true,

      textTheme: const TextTheme(
              bodyMedium: TextStyle(fontSize: fontSize, height: fontHeight),
              displaySmall: TextStyle(color: Colors.white),
              displayMedium: TextStyle(color: Colors.white),
              displayLarge: TextStyle(color: Colors.white))
          .apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
              decorationColor: Colors.white),
    );
  }
}

enum EggTheme {
  light,
  dark,
  egg,
}

class ThemeService extends ChangeNotifier {
  final theme = EggThemeLight();
  EggTheme cTheme;
  ThemeService() : cTheme = EggTheme.light;

  ThemeData currentTheme() {
    switch (cTheme) {
      case EggTheme.light:
        return theme.light;
      case EggTheme.dark:
        return theme.dark;
      case EggTheme.egg:
        return theme.light;
    }
  }

  ThemeMode mode() {
    switch (cTheme) {
      case EggTheme.light:
        return ThemeMode.light;
      case EggTheme.dark:
        return ThemeMode.dark;
      case EggTheme.egg:
        return ThemeMode.light;
    }
  }

  set applyTheme(EggTheme selection) {
    cTheme = EggTheme.dark;
    notifyListeners();
  }
}

@Riverpod(keepAlive: true)
ThemeService themeService(ThemeServiceRef ref) {
  return ThemeService();
}

@Riverpod(keepAlive: true)
EggTheme currentTheme(CurrentThemeRef ref) {
  final themeService = ref.watch(themeServiceProvider);
  return themeService.cTheme;
}

final themeProvider =
    ChangeNotifierProvider<ThemeService>((ref) => ThemeService());

class DarkModeNotifier extends StateNotifier<bool> {
  DarkModeNotifier() : super(false);

  void toggle() {
    state = !state;
  }
}

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>(
  (ref) => DarkModeNotifier(),
);
