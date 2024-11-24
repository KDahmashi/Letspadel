import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:padel/core/usecases/constants.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((_onAppStarted));
  }

  Future<void> _onAppStarted(SplashEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    try {
      // Simulate initialization tasks
      await Future.delayed(const Duration(seconds: 2));

      // Simulate authentication check
      final bool isAuthenticated = await _checkAuthentication();
      if (isAuthenticated) {
        emit(SplashLoaded());
      } else {
        emit(SplashError('user_not_auth'.tr()));
      }
    } catch (e) {
      emit(SplashError('An error occurred: $e'));
    }
  }

  // Fake authentication check
  Future<bool> _checkAuthentication() async {
    return auth.currentUser != null;
  }
}
