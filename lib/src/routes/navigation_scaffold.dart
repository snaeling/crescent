import 'package:auto_route/auto_route.dart';
import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:crescent/src/routes/app_router.gr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsScaffold(
        routes: [
          const HomeRoute(),
          SearchRoute(),
        ],
        builder: (context, child, animation) {
          return child;
        },
        bottomNavigationBuilder: (_, tabsRouter) {
          return NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            height: 60,
            destinations: [
              NavigationDestination(
                //onPressed: () => {shellState.goBranch(0)},
                icon: const Icon(Icons.home),
                selectedIcon: const Icon(Icons.home_filled),
                label: context.loc.home,
              ),
              NavigationDestination(
                //onPressed: () => {shellState.goBranch(1)},
                icon: const Icon(Icons.search),
                selectedIcon: const Icon(Icons.search_rounded),
                label: context.loc.search,
              ),
              NavigationDestination(
                //onPressed: () => {},
                icon: const Icon(Icons.notifications),
                label: context.loc.notifications,
              ),
              NavigationDestination(
                icon: const Icon(Icons.circle),
                label: context.loc.profile,
              ),
            ],
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: (int selectedIndex) =>
                tabsRouter.setActiveIndex(selectedIndex),
          );
        },
      ),
    );
  }
}
