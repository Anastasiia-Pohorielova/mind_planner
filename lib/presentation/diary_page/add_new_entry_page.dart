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

class AddNewEntryPage extends StatefulWidget {
  const AddNewEntryPage({Key? key}) : super(key: key);

  @override
  State<AddNewEntryPage> createState() => _AddNewEntryPageState();
}

class _AddNewEntryPageState extends State<AddNewEntryPage> {
  Mood? selectedMood;
  int currentStep = 1;
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      customAppBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: currentStep == 1 ? firstStep() : secondStep(),
      ),
    );
  }

  Widget firstStep() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dear user!',
            style: MindTextStyles.s26fw500,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'How was your day?',
            style: MindTextStyles.s18fw400,
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: GridView.extent(
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                for (var moodItem in Mood.values) ...[
                  Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    color: selectedMood == moodItem
                        ? MindColors.primary
                        : MindColors.surfaceContainer,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedMood = moodItem;
                        });
                      },
                      borderRadius: BorderRadius.circular(16.0),
                      radius: 16,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              moodItem.toUEmoji(),
                              style: const TextStyle(fontSize: 28),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              moodItem.name,
                              style: MindTextStyles.s18fw400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () {
                  setState(() {
                    currentStep = 2;
                  });
                },
                child: SizedBox(
                  width: 80,
                  height: 60,
                  child: Row(
                    children: [
                      Text(
                        'Next',
                        style: MindTextStyles.s18fw400
                            .copyWith(color: MindColors.white),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      );

  Widget secondStep() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 50,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: MindColors.surfaceContainer,
                borderRadius: BorderRadius.circular(12.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat("d MMM").format(DateTime.now()),
                  style: MindTextStyles.s24fw500,
                ),
                Text(
                  selectedMood != null ? selectedMood!.toUEmoji() : '-',
                  style: const TextStyle(fontSize: 30),
                )
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
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () {
                  setState(
                    () {
                      context.read<DiaryCubit>().addDiaryEntry(
                            DiaryEntry(
                              id:DateTime.now().microsecondsSinceEpoch.toString(),
                                date: DateTime.now(),
                                title: 'Tiytle',
                                content: _textController.text,
                                mood: selectedMood?.name ?? ''),
                          );
                      router.pop();
                    },
                  );
                },
                child: SizedBox(
                  width: 80,
                  height: 60,
                  child: Row(
                    children: [
                      const Icon(Icons.save_outlined),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Save',
                        style: MindTextStyles.s18fw400
                            .copyWith(color: MindColors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      );
}
