import 'package:mind_planner/models/diary_entry_model.dart';

import '../mock_services/database.dart';

Database populatedDatabase() {
  final database = Database();

  populateDiaryEntries(database);

  return database;
}

void populateDiaryEntries(Database database) {
  var entries = [
    DiaryEntry(
      id: 'id1',
      date: DateTime.now(),
      title: 'Title',
      content: 'Lon long long long ,long content',
      mood: 'sad',
    )
  ];

  database.diaryEntries.addAll(entries);
}
