import 'package:padel/features/navigation/navigation_screen.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/profile/screens/edit_profile_screen.dart';
import '../../features/profile/screens/my_booking_screen.dart';
import '../../features/home/widgets/player_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../features/splash/screens/splash_screen.dart';
import '../../features/home/screens/checkout_screen.dart';
import '../../features/home/screens/courts_screen.dart';
import '../../features/auth/screens/signup_screen.dart';
import '../../features/home/models/booking_model.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/home/screens/home_screen.dart';
import 'package:padel/core/usecases/boxes.dart';
import 'package:padel/core/usecases/keys.dart';
import '../../features/widgets/app_error.dart';
import '../services/navigator_service.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../usecases/constants.dart';
import 'package:hive/hive.dart';




final GoRouter router = GoRouter(
  navigatorKey: NavigatorService.navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: SplashScreen.routeName,
      redirect: (context, state) {
        Box<dynamic> box = Boxes.settings();
        bool onboarding = box.get(Keys.onboarding, defaultValue: true);
        if (onboarding) {
          return '/${OnboardingScreen.routeName}';
        }

        if (auth.currentUser == null) {
          return '/${LoginScreen.routeName}';
        }
        return null;
      },
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: '/${LoginScreen.routeName}',
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/${EditProfileScreen.routeName}',
      name: EditProfileScreen.routeName,
      builder: (context, state) => const EditProfileScreen(),
    ),

    GoRoute(
      path: '/${CheckoutScreen.routeName}',
      name: CheckoutScreen.routeName,
      builder: (context, state) {
        BookingModel booking = state.extra as BookingModel;
        return CheckoutScreen(booking: booking);
      },
    ),

    GoRoute(
      path: '/${CourtsScreen.routeName}',
      name: CourtsScreen.routeName,
      builder: (context, state) => const CourtsScreen(),
    ),

    GoRoute(
      path: '/${OnboardingScreen.routeName}',
      name: OnboardingScreen.routeName,
      builder: (context, state) => const OnboardingScreen(),
    ),

    GoRoute(
      path: '/${HomeScreen.routeName}',
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/${MyBookingScreen.routeName}',
      name: MyBookingScreen.routeName,
      builder: (context, state) => const MyBookingScreen(),
    ),

    GoRoute(
      path: '/${NavigationScreen.routeName}',
      name: NavigationScreen.routeName,
      builder: (context, state) => const NavigationScreen(),
    ),

    GoRoute(
      path: '/${PlayerPreferences.routeName}',
      name: PlayerPreferences.routeName,
      builder: (context, state) => const PlayerPreferences(),
    ),

    GoRoute(
      path: '/${SignupScreen.routeName}',
      name: SignupScreen.routeName,
      builder: (context, state) => const SignupScreen(),
    ),

  ],

  observers: [
    routeObserver,
  ],
  /*
  redirect: (context, state) {
    final loggedIn = authStateListenable.value;
    final goingToLogin = state.matchedLocation
        .contains('/${LoginScreen.routeName}');

    if (!loggedIn && !goingToLogin) {
      return '/${LoginScreen.routeName}';
    }

    if (loggedIn && goingToLogin) return '/';

    return null;
  },
  */
  // refreshListenable: authStateListenable,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => AppError(
    message: 'something_wrong'.tr(),
  ),
);

/// Route observer to use with RouteAware
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

