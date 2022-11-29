import 'package:auto_route/auto_route.dart';
import 'package:cohost_api/cohost.dart';
import 'package:crescent/src/common_widgets/global_error_display.dart';
import 'package:crescent/src/common_widgets/image_container.dart';
import 'package:crescent/src/features/authentication/application/auth_provider.dart';
import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:crescent/src/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationScreen extends ConsumerWidget {
  const NavigationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Project? user = ref.watch(authProvider).userState?.editedProjects[0];
    return SafeArea(
      child: GlobalErrorWrapper(
        AutoTabsScaffold(
          routes: [
            const HomeRoute(),
            SearchRoute(),
            if (user != null) ...[const NotificationsRoute()],
            if (user != null) ...[ProfileRoute(project: user)],
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
                if (user != null) ...[
                  NavigationDestination(
                    //onPressed: () => {},
                    icon: const Icon(Icons.notifications),
                    label: context.loc.notifications,
                  ),
                  NavigationDestination(
                    icon: user != null
                        ? Avatar(
                            user,
                            size: 50,
                            clickable: false,
                          )
                        : const Icon(Icons.circle),
                    label: context.loc.profile,
                  ),
                ],
              ],
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: (int selectedIndex) =>
                  tabsRouter.setActiveIndex(selectedIndex),
            );
          },
        ),
      ),
    );
  }
}
