part of 'diary_cubit.dart';



@immutable
class DiaryState {}

class DiaryInitial extends DiaryState {}
class DiaryLoading extends DiaryState {}
class DiarySucceeded extends DiaryState {
  DiarySucceeded(this.entries);

  final List<DiaryEntry> entries;
}
class DiaryError extends DiaryState {}