import 'package:crescent/src/routes/app_router.gr.dart';
import 'package:crescent/src/utils/scroll_override.dart';
import 'package:crescent/src/utils/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeProvider);
    return MaterialApp.router(
      scrollBehavior: ScrollOverride(),
      routerDelegate: _appRouter.delegate(initialRoutes: [const SplashRoute()]),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'crescent',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeProvider.notifier).currentTheme(),
      darkTheme: ref.read(themeServiceProvider).theme.dark,
      themeMode: darkMode ? ThemeMode.light : ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
