import 'package:brilloconnectz/core/services/bottom_nav_services.dart';
import 'package:brilloconnectz/core/utils/routes.dart';
import 'package:brilloconnectz/general_widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final List<String> pageKeys = [ Routes.homepage, Routes.profile, Routes.buddies, Routes.discover, Routes.setting ];

class BottomNavPages extends HookConsumerWidget {
  const BottomNavPages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentPage = ref.watch(currentPageProvider.state).state;
    final selectedIndexState = ref.watch(selectedIndexProvider.state);
    final navigatorKeys = ref.watch(navigatorKeysProvider);

    void selectTab(String tabItem, int index) {
      if (tabItem == currentPage) {
        navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);

        ref.read(newNavigationService).navigateToNamed(tabItem);

      } else {
        ref.read(currentPageProvider.state).state = tabItem;
        ref.read(selectedIndexProvider.state).state = index;

        ref.read(newNavigationService).navigateToNamed(tabItem);
      }
    }

    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await navigatorKeys[currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (currentPage != Routes.homepage) {
            selectTab(Routes.homepage, 0);
            return false;
          }
        }

        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(ref, Routes.homepage, currentPage),
            _buildOffstageNavigator(ref, Routes.profile, currentPage),
            _buildOffstageNavigator(ref, Routes.buddies, currentPage),
            _buildOffstageNavigator(ref, Routes.discover, currentPage),
            _buildOffstageNavigator(ref, Routes.setting, currentPage),
          ],
        ),
        bottomNavigationBar: BottomNavigationWidget(
          currentIndex: selectedIndexState,
          onTap: () {
            int index = selectedIndexState.state;

            selectTab(pageKeys[index], index);
          },
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(WidgetRef ref, String pageKey, String currentPage) {
    return Offstage(
      offstage: currentPage != pageKey,
      child: Navigator(
        key: ref.read(navigatorKeysProvider)[pageKey],
        initialRoute: Routes.homepage,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
