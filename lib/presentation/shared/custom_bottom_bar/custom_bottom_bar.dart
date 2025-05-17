import 'package:flutter/material.dart';

import '../../../res/styles/colors.dart';
import '../../../utils/router.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () => router.push('/'),
            child: const Icon(
              Icons.home_outlined,
              color: MindColors.textPrimary,
            ),
          ),
          InkWell(
            onTap: () =>  router.push('/diary'),
            child: const Icon(
              Icons.menu_book_outlined,
              color: MindColors.textPrimary,
            ),
          ),
          InkWell(
            onTap: () =>  router.push('/profile'),
            child: const Icon(
              Icons.person_outline,
              color: MindColors.textPrimary,
            ),
          ),
          InkWell(
            onTap: () =>  router.push('/settings'),
            child: const Icon(
              Icons.settings_outlined,
              color: MindColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}