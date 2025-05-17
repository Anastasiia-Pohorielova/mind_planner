import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_planner/presentation/diary_page/add_new_entry_page.dart';
import 'package:mind_planner/presentation/diary_page/diary_page.dart';
import 'package:mind_planner/presentation/diary_page/edit_entry_screen.dart';
import 'package:mind_planner/presentation/profile_page/profile_page.dart';
import 'package:mind_planner/presentation/settings_page/settings_page.dart';
import 'package:mind_planner/utils/scaffold_with_nested_navigation.dart';

import '../presentation/home_page/home_page.dart';


// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
// the UI shell
return ScaffoldWithNestedNavigation(
navigationShell: navigationShell);
},
      branches: [
        // first branch (A)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/',
              name: 'home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomePage(),
              ),
              routes: const [
                // child route
                // GoRoute(
                //   path: 'details',
                //   builder: (context, state) =>
                //   const DetailsScreen(label: 'A'),
                // ),
              ],
            ),
          ],
        ),
        // second branch (B)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/diary',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: DiaryPage(),
              ),
              routes:[
                // child route
                GoRoute(
                  path: 'new',
                  builder: (context, state) =>
                   const AddNewEntryPage(),
                ),
                // GoRoute(
                //   path: 'edit',
                //   builder: (context, state) =>
                //   const EditEntryScreen(),
                // ),
              ],
            ),
            // GoRoute(
            //   path: '/settings',
            //   pageBuilder: (context, state) => const NoTransitionPage(
            //     child: SettingsPage(),
            //   ),
            //   routes:const [
            //     // child route
            //     // GoRoute(
            //     //   path: 'details',
            //     //   builder: (context, state) =>
            //     //   const DetailsScreen(label: 'B'),
            //     // ),
            //   ],
            // ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsPage(),
              ),
              routes:[
                // child route
                // GoRoute(
                //   path: 'new',
                //   builder: (context, state) =>
                //   const AddNewEntryPage(),
                // ),
              ],
            ),
          ],
        ),
      ],
)
  ],
);