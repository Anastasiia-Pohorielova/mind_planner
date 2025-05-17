import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_planner/presentation/layouts/main_layout.dart';

import '../../localization/locale_provider.dart';
import '../../res/styles/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(customAppBar: AppBar(), body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(AppLocalizations.of(context).language, style: MindTextStyles.s18fw500,),
            DropdownMenu(initialSelection: 'English',
                dropdownMenuEntries: const [
              DropdownMenuEntry(value: 'en', label: 'English'),
              DropdownMenuEntry(value: 'uk', label: 'Ukrainian'),
            ], onSelected: (value) {
                context.read<LocaleCubit>().locale = Locale(value ?? 'en');
              },)
          ],)
        ],
      ),
    ));
  }
}
