import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(label: t.home, icon: const Icon(Icons.home_outlined)),
           NavigationDestination(label: t.diary, icon: const Icon(Icons.menu_book_outlined)),
        //  NavigationDestination(label: 'Profile', icon: Icon(Icons.person_outline)),
           NavigationDestination(label: t.settings, icon: const Icon(Icons.settings_outlined)),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}