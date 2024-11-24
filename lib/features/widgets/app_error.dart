import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../generated/assets.dart';
import 'package:lottie/lottie.dart';
import '../auth/screens/login_screen.dart';
import 'responsive_safe_area.dart';



class AppError extends StatelessWidget {
  final String? message;
  const AppError({
    this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return ResponsiveSafeArea(
      context: context,
      builder: (context) => Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Lottie.asset(
                    Assets.jsonsJsonError,
                    height: screenSize.height/2.4,
                  ),
                  const SizedBox(height: 5),
                  Text(message ?? 'error_wrong'.tr(),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: screenSize.width - 100,
                    child: ElevatedButton.icon(
                      icon: Icon(MdiIcons.refresh),
                      label: Text('try_again'.tr()),
                      onPressed: () {
                        context.pushReplacementNamed(LoginScreen.routeName);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
