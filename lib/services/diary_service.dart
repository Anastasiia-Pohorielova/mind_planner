
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../models/diary_entry_model.dart';

part 'diary_service.g.dart';

@RestApi(baseUrl: '')
abstract class DiaryService {
  factory DiaryService(Dio dio) = _DiaryService;

  @GET('entries')
  Future<List<DiaryEntry>> getDiaryEntries();

  @POST('entries')
  Future<List<DiaryEntry>> addDiaryEntry({@Body() required DiaryEntry entry});

  @PUT('entries')
  Future<DiaryEntry> editDiaryEntry({@Body() required DiaryEntry entry});
}