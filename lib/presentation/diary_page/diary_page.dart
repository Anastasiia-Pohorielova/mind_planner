import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_planner/presentation/components/entry_card.dart';
import 'package:mind_planner/utils/router.dart';

import '../../models/diary_entry_model.dart';
import '../../utils/date_formatter.dart';
import '../bloc/diary_cubit.dart';
import '../layouts/main_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  State<DiaryPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<DiaryPage> {
  @override
  void initState() {
    context.read<DiaryCubit>().getDiaryEntries();
    super.initState();
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return MainLayout(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            router.go(
              '/diary/new',
            );
          },
          child: const Icon(Icons.add),
        ),
        customAppBar: AppBar(),
        body: BlocBuilder<DiaryCubit, DiaryState>(builder: (context, state) {
          if (state is DiaryLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DiarySucceeded) {
            return Container(
              // color: MindColors.tertiary,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _getDates().length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formatToMonthYear(_getDates()[index])),
                            Text(
                                '${_monthEntriesCount(state.entries!, _getDates()[index])} ${t.memories}')
                          ],
                        ),
                      ),
                      for (int i = 0;
                          i <
                              monthEntries(state.entries!, _getDates()[index])
                                  .length;
                          i++) ...[
                        EntryCard(monthEntries(
                            state.entries!, _getDates()[index])[i])
                      ]
                    ],
                  );
                },
              ),
            );
          }
          return SizedBox();
        }));
  }

  List<DateTime> _getDates() {
    final startMonth = DateTime.now().month;
    final months = <DateTime>[];
    for (var year = 0; year < 2; year++) {
      for (var i = 0; i < 12; i++) {
        if (i == startMonth) {
          months.add(DateTime(DateTime.now().year - year - 1, 12));
        } else {
          months.add(DateTime(DateTime.now().year - year, startMonth - i));
        }
      }
    }
    return months;
  }

  int _monthEntriesCount(List<DiaryEntry> entries, DateTime time) {
    return entries.where((el) {
      return el.date.month == time.month && el.date.year == time.year;
    }).length;
  }

  List<DiaryEntry> monthEntries(List<DiaryEntry> entries, DateTime time) {
    return entries.where((el) {
      return el.date.month == time.month && el.date.year == time.year;
    }).toList();
  }
}
