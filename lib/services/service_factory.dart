import 'package:dio/dio.dart';

import 'diary_service.dart';

abstract class ServiceFactory {
  DiaryService createDiaryService(Dio dio);
}