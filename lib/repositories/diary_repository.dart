import 'package:mind_planner/services/diary_service.dart';

import '../models/diary_entry_model.dart';

class DiaryRepository {
  DiaryRepository(this._diaryService);

  final DiaryService _diaryService;

  Future<List<DiaryEntry>> getDiaryEntries() async {
    print('here');
    var data = await _diaryService.getDiaryEntries();
    print(data);
    return data;
  }

  Future<List<DiaryEntry>> addDiaryEntry(DiaryEntry entry) async {
    print('here');
    var data = await _diaryService.addDiaryEntry(entry: entry);
    print(data);
    return data;
  }

  Future<DiaryEntry> editDiaryEntry(DiaryEntry entry) async {
    print('here');
    var data = await _diaryService.editDiaryEntry(entry: entry);
    print(data);
    return data;
  }
}