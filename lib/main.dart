import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mind_planner/localization/locale_provider.dart';
import 'package:mind_planner/mock_services/mock_diary_service.dart';
import 'package:mind_planner/mock_services/mock_service_factory.dart';
import 'package:mind_planner/presentation/bloc/diary_cubit.dart';
import 'package:mind_planner/repositories/diary_repository.dart';
import 'package:mind_planner/res/styles/colors.dart';
import 'package:mind_planner/services/diary_service.dart';
import 'package:mind_planner/services/service_factory.dart';
import 'package:mind_planner/utils/mock_interceptor.dart';
import 'package:mind_planner/utils/router.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'mock_data/populated_database.dart';

final getIt = GetIt.instance;

void main() {
  registerDependencies();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DiaryCubit(getIt())),
        BlocProvider(create: (context) => LocaleCubit(getIt())),
      ], child: MyApp()));
}

ServiceFactory serviceFactory() => MockServiceFactory(
  populatedDatabase(),
  delayDuration: const Duration(milliseconds: 50),
);

void registerDependencies() {
  getIt.registerSingleton(
      Dio(BaseOptions(baseUrl: ''))..interceptors.add(MockInterceptor()));

  final diaryService = serviceFactory().createDiaryService(getIt());
  getIt.registerFactory(() => diaryService);
  getIt.registerFactory<DiaryRepository>(() => DiaryRepository(getIt()));
  getIt.registerFactory<LocaleState>(() => LocaleState());
  getIt.registerFactory(() => DiaryCubit(getIt()));
  getIt.registerFactory(() => LocaleCubit(getIt()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return MaterialApp.router(
            title: 'Flutter Demo',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              bottomSheetTheme: const BottomSheetThemeData(
                dragHandleColor: MindColors.white,
              ),
            ),
            locale: context.read<LocaleCubit>().locale,
            routerConfig: router,
        );
      }
    );
  }
}