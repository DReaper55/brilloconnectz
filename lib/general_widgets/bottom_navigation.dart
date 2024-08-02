import 'package:brilloconnectz/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class BottomNavigationWidget extends HookConsumerWidget {
  final StateController<int> currentIndex;
  final Function()? onTap;

  const BottomNavigationWidget({super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
        currentIndex: currentIndex.state,
        backgroundColor: Colors.white,
        elevation: 0.0,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          currentIndex.state = index;

          if(onTap == null) return;
          onTap!();
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            activeIcon: Icon(Icons.home, color: BrilloColors.primary,),
              icon: Icon(Icons.home_outlined)),

          BottomNavigationBarItem(
            label: 'Profile',
            activeIcon: Icon(Icons.person, color: BrilloColors.primary,),
              icon: Icon(Icons.person_2_outlined)),

          BottomNavigationBarItem(
            label: 'Buddies',
              activeIcon: Icon(Icons.people, color: BrilloColors.primary,),
              icon: Icon(Icons.people_outline)),

          BottomNavigationBarItem(
            label: 'Discover',
              activeIcon: Icon(Icons.search, color: BrilloColors.primary,),
              icon: Icon(Icons.search_outlined)),

          BottomNavigationBarItem(
            label: 'Settings',
              activeIcon: Icon(Icons.settings, color: BrilloColors.primary,),
              icon: Icon(Icons.settings_outlined)),
        ]);
  }
}