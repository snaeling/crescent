// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:crescent/src/features/posts/presentation/home_screen.dart';
import 'package:crescent/src/features/search/presentation/search_screen.dart';
import 'package:crescent/src/routes/navigation_scaffold.dart';
import 'package:crescent/src/routes/spash_screen.dart';
import 'package:flutter/material.dart';

import '../features/authentication/presentation/notifications_screen.dart';
import '../features/authentication/presentation/onboarding_screen.dart';
import '../features/posts/presentation/single_post_screen.dart';
import '../features/posts/presentation/tag_screen.dart';
import '../features/projects/presentation/profile_screen.dart';
import '../features/projects/presentation/project_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/splash',
      page: SplashScreen,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      path: '/',
      page: NavigationScreen,
      children: [
        AutoRoute(path: 'home', page: HomeScreen),
        AutoRoute(path: 'search', page: SearchScreen),
        AutoRoute(path: 'notifications', page: NotificationsScreen),
        AutoRoute(path: 'profile', page: ProfileScreen),
      ],
    ),
    AutoRoute(
      path: '/login',
      page: OnboardingScreen,
    ),
    AutoRoute(path: '/:handle', page: ProjectScreen),
    AutoRoute(path: '/:handle/post/:postId', page: SinglePostScreen),
    AutoRoute(path: '/tagged/:tag', page: TagScreen),
  ],
)
class $AppRouter {}
