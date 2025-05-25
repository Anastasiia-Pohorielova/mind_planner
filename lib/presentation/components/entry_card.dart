import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mind_planner/res/styles/text_styles.dart';
import 'package:mind_planner/utils/mood_extension.dart';

import '../../models/diary_entry_model.dart';
import '../../res/styles/colors.dart';
import '../bloc/diary_cubit.dart';
import '../diary_page/edit_entry_screen.dart';

final colors = [
  Colors.red.shade50,
  Colors.blue.shade50,
  Colors.green.shade50,
  Colors.deepOrange.shade50,
  Colors.pink.shade50,
  Colors.yellow.shade50
];

class EntryCard extends StatelessWidget {
  const EntryCard(this.entry, {Key? key}) : super(key: key);

  final DiaryEntry entry;

  @override
  Widget build(BuildContext context) {
    var color = colors[Random().nextInt(6)];
    return  Dismissible(
      key: Key(entry.id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.only(right: 24),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.red,
        ),
        child: Icon(Icons.delete, color: Colors.white,),
      ),
      onDismissed: (direction) {
        // Remove the item from the data source.

          context.read<DiaryCubit>().deleteDiaryEntry(entry.id);

        // Then show a snackbar.
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Deleted')));
      },
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => EditEntryScreen(
              entry,
            ),
          ),
        ),

      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 12.0),
              margin: const EdgeInsets.only(right: 8.0),
              decoration: const BoxDecoration(
                  border: Border(
                      right: BorderSide(
                color: MindColors.textDisabled,
                width: 1.0,
              ))),
              child: Column(
                children: [
                  Text(
                    entry.date.day.toString(),
                    style: MindTextStyles.s24fw500,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    DateFormat('MMM').format(DateTime(0, entry.date.month)),
                    style: MindTextStyles.s14fw400,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        entry.title ?? '',
                        style: MindTextStyles.s18fw500,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        entry.toMood().toUEmoji(),
                        style: const TextStyle(fontSize: 24, height: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    entry.content,
                    style: MindTextStyles.s14fw400,
                    overflow: TextOverflow.ellipsis,

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
