import 'package:bloc/bloc.dart';
import 'package:defi_deux/app_injector.dart';
import 'package:defi_deux/core/utils/my_bloc_observer.dart';
import 'package:defi_deux/isar_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'app.dart';
import 'core/utils/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInjector.init();
  await IsarService().cleanDb();

  Bloc.observer = MyBlocObserver();
  const arLocale = Locale(AppConstants.arCode);
  const enLocale = Locale(AppConstants.enCode);

  /// Lock device orientation to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: const [
        arLocale,
        enLocale,
      ],
      path: AppConstants.languagePath,
      fallbackLocale: enLocale,
      saveLocale: true,
      startLocale: enLocale,
      child: const App(),
    ),
  );
}
