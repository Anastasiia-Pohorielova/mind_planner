import 'package:dio/dio.dart';

import '../services/diary_service.dart';
import '../services/service_factory.dart';
import 'database.dart';
import 'mock_diary_service.dart';

class MockServiceFactory implements ServiceFactory {
  MockServiceFactory(
      this._database, {
        this.delayDuration,
      });

  final Database _database;
  final Duration? delayDuration;


  @override
  DiaryService createDiaryService(Dio dio) => MockDiaryService(
  _database,
  delayDuration: delayDuration,
  );
}


