import 'dart:async';

import 'package:mind_planner/models/diary_entry_model.dart';
import 'package:mind_planner/services/diary_service.dart';

import 'database.dart';

class MockDiaryService implements DiaryService {
  MockDiaryService(this.database, {
    Duration? delayDuration,
  });

  final Database database;

  @override
  Future<List<DiaryEntry>> addDiaryEntry({required DiaryEntry entry}) {
    database.diaryEntries.add(entry);
    return Future.value(database.diaryEntries);
  }

  @override
  Future<DiaryEntry> editDiaryEntry({required DiaryEntry entry}) {
   var index = database.diaryEntries.indexWhere((el)=> el.id == entry.id);
   database.diaryEntries.replaceRange(index, index + 1, [entry]);
    return Future.value(entry);
  }

  @override
  Future<List<DiaryEntry>> getDiaryEntries() {
    print('mock!!!!!');
    return Future.value(database.diaryEntries);
  }


}
