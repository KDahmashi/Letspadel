import 'package:padel/features/splash/screens/splash_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/usecases/boxes.dart';
import '../../../core/usecases/keys.dart';
import 'package:go_router/go_router.dart';
import '../../../generated/assets.dart';
import 'package:flutter/material.dart';
import '../models/onboard_model.dart';




class OnboardingScreen extends StatefulWidget {
  static String routeName = 'OnboardingScreen';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController pageController = PageController();

  late String _currentLanguage;
  bool isLastPage = false;

  @override
  void initState() {
    _currentLanguage = 'en';
    super.initState();
  }

  void _changeLanguage(String? newLanguage) {
    setState(() {
      if (newLanguage?.toLowerCase() == 'ar') {
        context.setLocale(Locale('ar', 'AR'));
      } else {
        context.setLocale(Locale('en', 'EN'));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    List<OnboardModel> items = [
      OnboardModel(
        title: "intro_title1".tr(),
        descriptions: "intro_des1".tr(),
        image: Assets.imagesLogoTrans,
      ),
      OnboardModel(
        title: "intro_title2".tr(),
        descriptions: "intro_des2".tr(),
        image: Assets.imagesLogoTrans,
      ),
      OnboardModel(
        title: "intro_title3".tr(),
        descriptions: "intro_des3".tr(),
        image: Assets.imagesLogoTrans,
      ),
      OnboardModel(
        title: "intro_title4".tr(),
        descriptions: "intro_des4".tr(),
        image: Assets.imagesLogoTrans,
      ),
    ];
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: isLastPage
            ? getStarted()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Skip Button
                  TextButton(
                    onPressed: () => pageController.jumpToPage(items.length - 1),
                    child: Text(
                      "skip".tr(),
                    ),
                  ),

                  //Indicator
                  SmoothPageIndicator(
                    controller: pageController,
                    count: items.length,
                    onDotClicked: (index) => pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                    ),
                    effect: WormEffect(
                      activeDotColor: context.theme.primaryColor,
                      dotHeight: 12,
                      dotWidth: 12,
                    ),
                  ),

                  //Next Button
                  TextButton(
                    onPressed: () => pageController.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                    ),
                    child: Text("next".tr()),
                  ),
                ],
              ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          onPageChanged: (index) => setState(() {
            isLastPage = items.length - 1 == index;
          }),
          itemCount: items.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
                    Image.asset(items[index].image),
                    const SizedBox(height: 15),
                    Text(
                      items[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      items[index].descriptions,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
              
                    if (index == 0)
                      ListTile(
                        title: Text(
                          'select_language'.tr(),
                        ),
                        leading: Icon(Icons.language),
                        subtitle: DropdownButtonFormField<String>(
                          value: _currentLanguage,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.theme.colorScheme.surface,
                          ),
                          hint: Text(
                            'select_language'.tr(),
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.theme.colorScheme.surface,
                            ),
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: context.theme.colorScheme.surface.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: _changeLanguage,
                          items: <String>['en', 'ar'].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value == 'en' ? 'English' : 'العربية',
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: context.theme.colorScheme.surface,
                                ),
                              ),
                            );
                          }).toList(),
                          dropdownColor: context.theme.colorScheme.primaryContainer,
                        ),
                      ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //Get started button
  Widget getStarted() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: () async {
          Box<dynamic> box = Boxes.settings();
          await box.put(Keys.onboarding, false);
          if (mounted) context.pushReplacementNamed(SplashScreen.routeName);
        },
        child: Text(
          "get_started".tr(),
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          // style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
