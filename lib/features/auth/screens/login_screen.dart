import 'package:padel/features/widgets/responsive_safe_area.dart';
import 'package:padel/features/auth/screens/signup_screen.dart';
import 'package:padel/core/extensions/show_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../navigation/navigation_screen.dart';
import '../../../core/usecases/constants.dart';
import 'package:go_router/go_router.dart';
import '../../../generated/assets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:developer';




class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool loading = false;

  void setLoading(bool bool) {
    setState(() {
      loading = bool;
    });
  }


  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      context: context,
      color: context.theme.primaryColor,
      uiOverlayStyle: SystemUiOverlayStyle.light,
      builder: (_) => Container(
        // color: context.theme.primaryColor,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBg),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              context.theme.primaryColor.withOpacity(0.9),
              BlendMode.darken,
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text(
                        'app_name'.tr(),
                        style: context.theme.textTheme.headlineMedium?.copyWith(
                          color: context.theme.colorScheme.surface,
                        ),
                      ),
                    ),

                    //! Email
                    TextFormField(
                      style: TextStyle(
                        color: context.theme.primaryColor,
                      ),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [
                        AutofillHints.email,
                      ],
                      decoration: InputDecoration(
                        hintText: 'email'.tr(),
                        // border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'pls_enter_email'.tr();
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'pls_enter_valid_email'.tr();
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: obscureText,
                      autofillHints: const [
                        AutofillHints.password,
                      ],
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(
                        color: context.theme.primaryColor,
                      ),
                      decoration: InputDecoration(
                        hintText: 'password'.tr(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureText ? Icons.visibility : Icons.visibility_off,
                            color: context.theme.primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'pls_enter_pass'.tr();
                        } else if (value.length < 6) {
                          return 'pass_must_least_6'.tr();
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.0),
                    loading ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ) : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(
                            width: 1,
                            color: context.theme.colorScheme.surface,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (_formKey.currentState?.validate() ?? false) {
                            try {
                              setLoading(true);
                              UserCredential userCredential = await auth.signInWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              );

                              if (userCredential.user != null) {
                                context.showSnackBar(
                                  message: 'login_success'.tr(),
                                  color: context.theme.colorScheme.surface,
                                );
                                context.goNamed(NavigationScreen.routeName);
                              }
                            } on FirebaseAuthException catch (e) {
                              setLoading(false);
                              if (e.code == 'user-not-found') {
                                log('user_not_found'.tr());
                                context.showSnackBar(
                                  message: 'user_not_found'.tr(),
                                  color: context.theme.colorScheme.error,
                                );
                              } else if (e.code == 'wrong-password') {
                                log('wrong_password'.tr());
                                context.showSnackBar(
                                  message: 'wrong_password'.tr(),
                                  color: context.theme.colorScheme.error,
                                );
                              } else {
                                log('${e.message}'.tr());
                                context.showSnackBar(
                                  message: '${e.message}',
                                  color: context.theme.colorScheme.error,
                                );
                              }
                            } catch (e) {
                              log(e.toString());
                              setLoading(false);
                              context.showSnackBar(
                                message: e.toString(),
                                color: context.theme.colorScheme.error,
                              );
                            }
                          }
                        },
                        child: Text(
                          'login'.tr(),
                        ),
                      ),
                    ),

                    //! Create Account
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      margin: const EdgeInsets.only(bottom: 20, top: 8),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'you_dont_have_account'.tr(),
                          style: context.theme.textTheme.bodyMedium,
                          children: <TextSpan>[
                            const TextSpan(text: ' '),
                            TextSpan(
                              text: 'create_account'.tr(),
                              style: context.theme.textTheme.bodyMedium?.copyWith(
                                color: context.theme.colorScheme.surface,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => context.pushNamed(SignupScreen.routeName),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'agree_terms_service'.tr(),
                          style: context.theme.textTheme.bodyMedium,
                          children: <TextSpan>[
                            const TextSpan(text: ' '),
                            TextSpan(
                                text: 'terms_of_use'.tr(),
                                style: context.theme.textTheme.bodyMedium?.copyWith(
                                  color: context.theme.colorScheme.surface,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    String title = 'terms_of_service'.tr();
                                    // context.pushNamed(
                                    //   WebVewApp.routeName,
                                    //   queryParameters: {
                                    //     'title': title,
                                    //     'url': termsOfServiceUrl,
                                    //   },
                                    // );
                                  }),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
