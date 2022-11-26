// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:cohost_api/cohost.dart' as _i11;
import 'package:flutter/material.dart' as _i10;

import '../features/onboarding/presentation/onboarding_screen.dart' as _i3;
import '../features/posts/presentation/home_screen.dart' as _i7;
import '../features/posts/presentation/single_post_screen.dart' as _i5;
import '../features/posts/presentation/tag_screen.dart' as _i6;
import '../features/projects/presentation/project_screen.dart' as _i4;
import '../features/search/presentation/search_screen.dart' as _i8;
import 'navigation_scaffold.dart' as _i2;
import 'spash_screen.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    NavigationRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.NavigationScreen(),
        transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardingScreen(),
      );
    },
    ProjectRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProjectRouteArgs>(
          orElse: () =>
              ProjectRouteArgs(handle: pathParams.getString('handle')));
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ProjectScreen(
          key: args.key,
          handle: args.handle,
          project: args.project,
        ),
      );
    },
    SinglePostRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SinglePostRouteArgs>(
          orElse: () => SinglePostRouteArgs(
                handle: pathParams.getString('handle'),
                postId: pathParams.getInt('postId'),
              ));
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.SinglePostScreen(
          key: args.key,
          handle: args.handle,
          postId: args.postId,
          post: args.post,
        ),
      );
    },
    TagRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TagRouteArgs>(
          orElse: () => TagRouteArgs(tag: pathParams.getString('tag')));
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.TagScreen(
          key: args.key,
          tag: args.tag,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.HomeScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.SearchScreen(key: args.key),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          NavigationRoute.name,
          path: '/dashboard',
          children: [
            _i9.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: NavigationRoute.name,
            ),
            _i9.RouteConfig(
              SearchRoute.name,
              path: 'search',
              parent: NavigationRoute.name,
            ),
          ],
        ),
        _i9.RouteConfig(
          OnboardingRoute.name,
          path: '/login',
        ),
        _i9.RouteConfig(
          ProjectRoute.name,
          path: '/:handle',
        ),
        _i9.RouteConfig(
          SinglePostRoute.name,
          path: '/:handle/post/:postId',
        ),
        _i9.RouteConfig(
          TagRoute.name,
          path: '/tagged/:tag',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.NavigationScreen]
class NavigationRoute extends _i9.PageRouteInfo<void> {
  const NavigationRoute({List<_i9.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i3.OnboardingScreen]
class OnboardingRoute extends _i9.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/login',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i4.ProjectScreen]
class ProjectRoute extends _i9.PageRouteInfo<ProjectRouteArgs> {
  ProjectRoute({
    _i10.Key? key,
    required String handle,
    _i11.Project? project,
  }) : super(
          ProjectRoute.name,
          path: '/:handle',
          args: ProjectRouteArgs(
            key: key,
            handle: handle,
            project: project,
          ),
          rawPathParams: {'handle': handle},
        );

  static const String name = 'ProjectRoute';
}

class ProjectRouteArgs {
  const ProjectRouteArgs({
    this.key,
    required this.handle,
    this.project,
  });

  final _i10.Key? key;

  final String handle;

  final _i11.Project? project;

  @override
  String toString() {
    return 'ProjectRouteArgs{key: $key, handle: $handle, project: $project}';
  }
}

/// generated route for
/// [_i5.SinglePostScreen]
class SinglePostRoute extends _i9.PageRouteInfo<SinglePostRouteArgs> {
  SinglePostRoute({
    _i10.Key? key,
    required String handle,
    required int postId,
    _i11.Post? post,
  }) : super(
          SinglePostRoute.name,
          path: '/:handle/post/:postId',
          args: SinglePostRouteArgs(
            key: key,
            handle: handle,
            postId: postId,
            post: post,
          ),
          rawPathParams: {
            'handle': handle,
            'postId': postId,
          },
        );

  static const String name = 'SinglePostRoute';
}

class SinglePostRouteArgs {
  const SinglePostRouteArgs({
    this.key,
    required this.handle,
    required this.postId,
    this.post,
  });

  final _i10.Key? key;

  final String handle;

  final int postId;

  final _i11.Post? post;

  @override
  String toString() {
    return 'SinglePostRouteArgs{key: $key, handle: $handle, postId: $postId, post: $post}';
  }
}

/// generated route for
/// [_i6.TagScreen]
class TagRoute extends _i9.PageRouteInfo<TagRouteArgs> {
  TagRoute({
    _i10.Key? key,
    required String tag,
  }) : super(
          TagRoute.name,
          path: '/tagged/:tag',
          args: TagRouteArgs(
            key: key,
            tag: tag,
          ),
          rawPathParams: {'tag': tag},
        );

  static const String name = 'TagRoute';
}

class TagRouteArgs {
  const TagRouteArgs({
    this.key,
    required this.tag,
  });

  final _i10.Key? key;

  final String tag;

  @override
  String toString() {
    return 'TagRouteArgs{key: $key, tag: $tag}';
  }
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.SearchScreen]
class SearchRoute extends _i9.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({_i10.Key? key})
      : super(
          SearchRoute.name,
          path: 'search',
          args: SearchRouteArgs(key: key),
        );

  static const String name = 'SearchRoute';
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }
}
