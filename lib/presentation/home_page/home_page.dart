import 'package:flutter/material.dart';
import 'package:mind_planner/presentation/layouts/main_layout.dart';
import 'package:mind_planner/res/styles/colors.dart';

import '../../res/styles/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Plan {
  Plan(this.id, {required this.content, required this.date});

  final String id;
  final String content;
  final DateTime date;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Plan> upcomingPlans = [
    Plan('id1', content: 'Do groceries', date: DateTime.now()),
    Plan('id1', content: 'Buy phone', date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);

    return MainLayout(
      customAppBar: AppBar(
        // color:
        backgroundColor: MindColors.secondary,
        title: Text(
         t.helloUser('Nastia'),
          style: MindTextStyles.s34fw500,
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: MindColors.primary,
        tooltip: 'Increment',
        onPressed: (){},
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: Container(
        color: MindColors.white,
        margin: const EdgeInsets.all(8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.upcomingPlans,
                style: MindTextStyles.s18fw500,
              ),
              for(int i = 0; i<upcomingPlans.length; i++)...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: const BoxDecoration(
                    color: MindColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  child: Row(children: [
                    Text('${upcomingPlans[i].date.hour}:${upcomingPlans[i].date.minute}'),
                    const SizedBox(width: 16,),
                    Text(upcomingPlans[i].content)
                  ],),
                )
              ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(t.addNewTask, style: MindTextStyles.s18fw500,),
                    IconButton(
                        onPressed: () {},
                        iconSize: 40,
                        icon: const Icon(Icons.add),
                    )
                  ],
                )
            ]),
      ),
    );
  }
}
