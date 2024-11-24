part of 'splash_bloc.dart';


sealed class SplashState extends Equatable {
  const SplashState();
}

final class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}

final class SplashLoading extends SplashState {
  @override
  List<Object> get props => [];
}

final class SplashLoaded extends SplashState {
  @override
  List<Object> get props => [];
}

final class SplashError extends SplashState {
  final String message;

  const SplashError(this.message);

  @override
  List<Object> get props => [message];
}