import 'package:padel/core/usecases/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SplashObserver extends BlocObserver {

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.i('SplashObserver Event: ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.i('SplashObserver Change: ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.i('SplashObserver Error: ${bloc.runtimeType}, $error');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.i('SplashObserver Transition: ${bloc.runtimeType}, $transition');
  }

}
