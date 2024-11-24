part of '../../main.dart';


Future<void> _mainInitializer() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureInjection(Env.prod);

  //-> This Prevent closing native splash screen until we finish warming-up custom splash images.
  //-> App layout will be built but not displayed.
  widgetsBinding.deferFirstFrame();
  widgetsBinding.addPostFrameCallback((_) async {
    // Run any function you want to wait for before showing app layout
    final BuildContext? context = widgetsBinding.rootElement;
    if (context != null) {
      await _precacheImage(context);
    }
    //-> Closes splash screen, and show the app layout.
    widgetsBinding.allowFirstFrame();
  });

  if (kDebugMode) {
    Bloc.observer = SplashObserver();
  }
}

Future<void> _precacheImage(BuildContext context) async {
  await Future.wait([
    precacheImage(
      const AssetImage(Assets.imagesLogoTrans),
      context,
    ),
    precacheImage(
      const AssetImage(Assets.imagesLogo),
      context,
    ),
    precacheImage(
      const AssetImage(Assets.imagesBg),
      context,
    ),
  ]);
}
