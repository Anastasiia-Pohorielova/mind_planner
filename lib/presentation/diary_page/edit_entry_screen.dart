import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mind_planner/models/diary_entry_model.dart';
import 'package:mind_planner/presentation/layouts/main_layout.dart';
import 'package:mind_planner/res/styles/colors.dart';
import 'package:mind_planner/res/styles/text_styles.dart';
import 'package:mind_planner/utils/mood_extension.dart';
import 'package:mind_planner/utils/router.dart';

import '../bloc/diary_cubit.dart';

class EditEntryScreen extends StatefulWidget {
  const EditEntryScreen(this.entry, {Key? key}) : super(key: key);

  final DiaryEntry entry;

  @override
  State<EditEntryScreen> createState() => _EditEntryScreenState();
}

class _EditEntryScreenState extends State<EditEntryScreen> {
  var _textController = TextEditingController();



  @override
  void initState() {
    _textController.text = widget.entry.content;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      customAppBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            setState(
                  () {
                context.read<DiaryCubit>().editDiaryEntry(
                  DiaryEntry(
                      id: widget.entry.id,
                      date: DateTime.now(),
                      title: _textController.text.substring(0, 20),
                      content: _textController.text, mood: ''),
                );
                router.pop();
              },
            );
          },
          icon: const Icon(Icons.save_outlined),
        ),
      ],),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
            color: MindColors.surfaceContainer,
            borderRadius: BorderRadius.all(Radius.circular(8))),
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
                      ),),),
              child: Column(
                children: [
                  Text(
                    widget.entry.date.day.toString(),
                    style: MindTextStyles.s24fw500,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    DateFormat('MMM').format(DateTime(0, widget.entry.date.month)),
                    style: MindTextStyles.s14fw400,
                  ),
                ],
              ),
            ),
            Text(
              widget.entry.toMood().toUEmoji(),
              style: const TextStyle(fontSize: 24, height: 1),
            ),

          ],
        ),
      ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
                child: TextField(
                  controller: _textController,
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  style: MindTextStyles.s18fw400,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Tell about your day...',
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
