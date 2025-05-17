import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_entry_model.freezed.dart';
part 'diary_entry_model.g.dart';


@freezed
abstract class DiaryEntry with _$DiaryEntry {
  const factory DiaryEntry({
    required String id,
    required DateTime date,
    required String title,
    required String content,
    required String mood,
}) = _DiaryEntry;

  factory DiaryEntry.fromJson(Map<String, Object?> json) => _$DiaryEntryFromJson(json);

}