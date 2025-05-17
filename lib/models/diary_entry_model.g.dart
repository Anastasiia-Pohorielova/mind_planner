// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiaryEntryImpl _$$DiaryEntryImplFromJson(Map<String, dynamic> json) =>
    _$DiaryEntryImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      title: json['title'] as String,
      content: json['content'] as String,
      mood: json['mood'] as String,
    );

Map<String, dynamic> _$$DiaryEntryImplToJson(_$DiaryEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'title': instance.title,
      'content': instance.content,
      'mood': instance.mood,
    };
