import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:easy_localization/easy_localization.dart';
import 'features/splash/bloc/splash_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/splash/bloc/splash_bloc.dart';
import 'core/services/snack_bar_service.dart';
import 'package:padel/firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/injection/injection.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'generated/assets.dart';

part 'core/services/main_initializer.dart';


void main() async {
  await _mainInitializer();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'EN'),
      Locale('ar', 'AR'),
    ],
    path: 'assets/translations',
    // startLocale: Locale('ar', 'AR'),
    startLocale: Locale('en', 'EN'),
    fallbackLocale: const Locale('en', 'EN'),
    child: MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp.router(
        title: 'Padel',
        locale: context.locale,
        routeInformationProvider: router.routeInformationProvider,
        themeMode: ThemeMode.dark,
        routeInformationParser: router.routeInformationParser,
        localizationsDelegates: context.localizationDelegates,
        scaffoldMessengerKey: SnackBarService.scaffoldKey,
        backButtonDispatcher: router.backButtonDispatcher,
        supportedLocales: context.supportedLocales,
        routerDelegate: router.routerDelegate,
        darkTheme: AppTheme.customDarkTheme,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.customLightTheme,
        // routerConfig: router,
      ),
    );
  }
}
