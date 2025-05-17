import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(super.initialState);

  Locale? _locale;

  Locale get locale => _locale ?? const Locale('en');

  set locale(Locale value) {
    print('here');
    emit(LocaleLoading());
    _locale = value;
    emit(LocaleChangeSucceeded());
  }

  void clearLocale() {
    _locale = null;
    emit(LocaleChangeSucceeded());
  }
}

@immutable
class LocaleState {}

class LocaleInitial extends LocaleState {}

class LocaleLoading extends LocaleState {}

class LocaleChangeSucceeded extends LocaleState {}

class LocaleError extends LocaleState {}
