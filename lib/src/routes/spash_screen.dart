import 'package:auto_route/auto_route.dart';
import 'package:crescent/src/features/authentication/application/auth_provider.dart';
import 'package:crescent/src/features/authentication/data/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_router.gr.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    gotoHome(String cookie) async {
      await ref.watch(userRepositoryProvider).logInWithCookie(cookie);
      context.router.replace(const NavigationRoute());
    }

    gotoOnboarding() {
      context.router.replace(const OnboardingRoute());
    }

    //TODO: Implement proper onboarding.
    Future<void> onboardingCheck() async {
      const storage = FlutterSecureStorage();

      String? cookie = await storage.read(key: 'cookie');

      bool showOnboarding = true;
      if (cookie != null) showOnboarding = false;

      if (showOnboarding) {
        gotoOnboarding();
      } else {
        gotoHome(cookie!);
      }
    }

    useEffect(() {
      onboardingCheck();
      return null;
    });
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/icon/icon.png'),
      ),
    );
  }
}
