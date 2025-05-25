import 'package:bloc/bloc.dart';
import 'package:mind_planner/repositories/diary_repository.dart';
import 'package:mind_planner/models/diary_entry_model.dart';
import 'package:flutter/cupertino.dart';

part 'diary_state.dart';

class DiaryCubit extends Cubit<DiaryState> {
  final DiaryRepository diaryRepository;

  DiaryCubit(this.diaryRepository) : super(DiaryInitial());

  void getDiaryEntries() async {
    emit(DiaryLoading());
    print('ger');
    final entries = await diaryRepository.getDiaryEntries();
    print(entries);
    emit(DiarySucceeded(entries));
  }

  void addDiaryEntry(DiaryEntry entry) async {
    emit(DiaryLoading());
    print('ger');
    final entries = await diaryRepository.addDiaryEntry(entry);
    print(entries);
    emit(DiarySucceeded(entries));
  }

  void editDiaryEntry(DiaryEntry entry) async {
    emit(DiaryLoading());
    print('ger');
    final _entry = await diaryRepository.editDiaryEntry(entry);

    emit(DiarySucceeded([_entry]));
  }

  void deleteDiaryEntry(String entryId) async {
    emit(DiaryLoading());
    print('del');
    final _entry = await diaryRepository.deleteDiaryEntry(entryId);

    emit(DiarySucceeded(null));
  }

}