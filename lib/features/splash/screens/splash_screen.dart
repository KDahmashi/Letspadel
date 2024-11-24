import 'package:padel/core/extensions/ui_extension.dart';
import '../../navigation/navigation_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
import '../../../generated/assets.dart';
import 'package:flutter/material.dart';
import '../../widgets/app_error.dart';
import '../bloc/splash_bloc.dart';



class SplashScreen extends StatefulWidget {
  static String routeName = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashBloc _splashBloc;

  @override
  void initState() {
    _splashBloc = context.read<SplashBloc>();
    _splashBloc.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoaded) {
            context.pushReplacementNamed(NavigationScreen.routeName);
          } else if (state is SplashError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            if (state is SplashError) {
              return AppError(message: state.message);
            } else {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      Assets.imagesLogoTrans,
                      height: context.screenSize.width/2,
                    ),
                    CupertinoActivityIndicator(
                      color: Colors.white,
                      radius: 20,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
