import 'package:padel/features/home/widgets/your_clubs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/usecases/constants.dart';
import '../widgets/player_preferences.dart';
import 'package:go_router/go_router.dart';
import '../widgets/play_your_match.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {

  @override
  bool get wantKeepAlive => true;

  // late AnimationController _animationController;
  // late Animation<double> _animation;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _animationController = AnimationController(
  //     vsync: this,
  //     duration: Duration(milliseconds: 260),
  //   );
  //   final curvedAnimation = CurvedAnimation(
  //     curve: Curves.easeInOut,
  //     parent: _animationController,
  //   );
  //   _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: StreamBuilder<User?>(
          stream: auth.userChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return Text(
                snapshot.data?.displayName ?? 'Oops!',
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              );
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Get One Step Ahead
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.22,
                    color: context.theme.primaryColor.withOpacity(0.4),
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.circle,
                        color: context.theme.primaryColor,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Flexible(
                        child: Text(
                          'get_one_step_ahead'.tr().toUpperCase(),
                          style: context.textTheme.headlineSmall?.copyWith(
                            color: context.theme.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'get_notified_available'.tr(),
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.theme.colorScheme.outlineVariant,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: context.theme.colorScheme.outlineVariant,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            //! Remember
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'remember'.tr(),
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Card(
                    color: context.theme.colorScheme.surface,
                    child: ListTile(
                      onTap: () => context.pushNamed(PlayerPreferences.routeName),
                      leading: Icon(
                        Icons.key,
                        color: context.theme.primaryColor,
                        size: 16,
                      ),
                      title: Text(
                        'edit_your_player'.tr(),
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.theme.colorScheme.outlineVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'best_hand'.tr(),
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.theme.colorScheme.outlineVariant,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: context.theme.primaryColor,
                        size: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            //! Play Your Match
            PlayYourMatch(),

            //! Your Clubs
            YourClubs(),

            const SizedBox(height: 85),
          ],
        ),
      ),
      /*
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionBubble(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          animation: _animation,
          // On pressed change animation state
          onPressed: () =>
              _animationController.isCompleted ? _animationController.reverse() : _animationController.forward(),
          // onPressed: () {
          //   firestore.collection('courts').doc('COURT011').set(
          //       {
          //         "court_id": "COURT011",
          //         "name": "Riverside Padel Club",
          //         "description": "Experience Padel by the river.",
          //         "surface_type": "Grass",
          //         "indoor": false,
          //         "lighting": true,
          //         "image": "https://example.com/images/court11.jpg",
          //         "location": {
          //           "address": "808 River Lane",
          //           "city": "Flowertown",
          //           "state": "River State",
          //           "country": "Fluvia",
          //           "postal_code": "57483"
          //         },
          //         "contact": {
          //           "phone": "+1098767000",
          //           "email": "support@riversidepadel.com",
          //           "website": "https://www.riversidepadel.com"
          //         }
          //       }
          //   ).then((value) => print("Court Added")).catchError((error) => print("Failed to add court: $error"));
          // },
          iconData: Icons.add,
          iconColor: context.theme.colorScheme.surface,
          backgroundColor: context.theme.colorScheme.onSecondary,
          items: <Widget>[
            BubbleMenu(
              title: 'upload_score'.tr(),
              iconColor: context.theme.colorScheme.surface,
              bubbleColor: context.theme.colorScheme.onSecondary,
              icon: MdiIcons.counter,
              style: TextStyle(
                fontSize: 16,
                color: context.theme.colorScheme.surface,
              ),
              onPressed: () {
                _animationController.reverse();
              },
            ),
            BubbleMenu(
              title: 'booking'.tr(),
              iconColor: context.theme.colorScheme.surface,
              bubbleColor: context.theme.colorScheme.onSecondary,
              icon: Icons.calendar_month,
              style: TextStyle(
                fontSize: 16,
                color: context.theme.colorScheme.surface,
              ),
              onPressed: () {
                _animationController.reverse();
              },
            ),
            BubbleMenu(
              title: 'match'.tr(),
              iconColor: context.theme.colorScheme.surface,
              bubbleColor: context.theme.colorScheme.onSecondary,
              icon: MdiIcons.tennis,
              style: TextStyle(
                fontSize: 16,
                color: context.theme.colorScheme.surface,
              ),
              onPressed: () {
                _animationController.reverse();
              },
            ),
          ],
        ),
      ),
      */
    );
  }
}
