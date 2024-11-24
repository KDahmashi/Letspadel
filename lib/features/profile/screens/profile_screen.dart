import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:padel/core/usecases/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../auth/screens/login_screen.dart';
import 'package:go_router/go_router.dart';
import '../../../generated/assets.dart';
import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'my_booking_screen.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin<ProfileScreen> {
  @override
  bool get wantKeepAlive => true;

  late String _currentLanguage;

  @override
  void initState() {
    _currentLanguage = 'en';
    super.initState();
  }

  void getLocale()  {
    _currentLanguage = context.locale.languageCode;
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
    getLocale();
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'profile'.tr(),
          textAlign: TextAlign.center,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          // IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {},
          // ),

          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await auth.signOut();
              context.pushReplacementNamed(LoginScreen.routeName);
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! Profile Picture
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              // decoration: BoxDecoration(
              //   border: Border(
              //     bottom: BorderSide(
              //       width: 0.22,
              //       color: context.theme.primaryColor.withOpacity(0.4),
              //     ),
              //   ),
              // ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      Assets.imagesDefaultUser,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<User?>(
                        stream: auth.userChanges(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else {
                            return Text(
                              snapshot.data?.displayName ?? 'Oops!',
                              style: context.textTheme.bodyLarge?.copyWith(
                                color: context.theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }
                        },
                      ),
                      Text(
                        'add_my_location'.tr(),
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //! Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //! Matches
                Column(
                  children: [
                    Text(
                      '0',
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: context.theme.colorScheme.primary,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Text(
                      'matches'.tr(),
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.theme.colorScheme.primary,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),

                //! Followers
                Column(
                  children: [
                    Text(
                      '0',
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: context.theme.colorScheme.primary,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Text(
                      'followers'.tr(),
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.theme.colorScheme.primary,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),

                //! Following
                Column(
                  children: [
                    Text(
                      '0',
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: context.theme.colorScheme.primary,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Text(
                      'following'.tr(),
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.theme.colorScheme.primary,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            //! Profile
            OutlinedButton(
              onPressed: () => context.pushNamed(EditProfileScreen.routeName),
              child: Text(
                'edit_profile'.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.primary,
                  height: 1,
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Divider(
              height: 0,
            ),

            //! Bookings
            ListTile(
              title: Text(
                'my_bookings'.tr(),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
              ),
              leading: Icon(Icons.calendar_today),
              trailing: Icon(Icons.arrow_forward_ios),
              subtitle: Text(
                'view_all'.tr(),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
              ),
              onTap: () => context.pushNamed(MyBookingScreen.routeName),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const Divider(
                height: 0,
                thickness: 0.22,
              ),
            ),

            //! Settings
            ListTile(
              title: Text(
                'select_language'.tr(),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
              ),
              leading: Icon(Icons.language),
              subtitle: DropdownButtonFormField<String>(
                value: _currentLanguage,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: context.theme.primaryColor.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: _changeLanguage,
                dropdownColor: context.theme.colorScheme.onPrimary,
                items: <String>['en', 'ar'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value == 'en' ? 'English' : 'العربية',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.theme.colorScheme.primary,
                      ),
                    ),
                  );
                }).toList(),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
