// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $themeServiceHash() => r'94593034aefe34aee4a14937232ddc54da245730';

/// See also [themeService].
final themeServiceProvider = Provider<ThemeService>(
  themeService,
  name: r'themeServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $themeServiceHash,
);
typedef ThemeServiceRef = ProviderRef<ThemeService>;
String $currentThemeHash() => r'837fd78de88ffd07ae16bd8bdd864ed04f5a73b2';

/// See also [currentTheme].
final currentThemeProvider = Provider<EggTheme>(
  currentTheme,
  name: r'currentThemeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $currentThemeHash,
);
typedef CurrentThemeRef = ProviderRef<EggTheme>;
