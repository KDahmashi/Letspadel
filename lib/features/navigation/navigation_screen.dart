import 'package:flutter/services.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:padel/features/home/screens/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:padel/features/widgets/responsive_safe_area.dart';
import '../community/screens/community_screen.dart';
import '../profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';



class NavigationScreen extends StatefulWidget {
  static String routeName = 'NavigationScreen';
  const NavigationScreen({super.key});

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with SingleTickerProviderStateMixin {

  late final TabController _tabController;
  int _selectedIndex = 0;


  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      context: context,
      color: context.theme.primaryColor,
      uiOverlayStyle: SystemUiOverlayStyle.light,
      builder: (context) {
        return Scaffold(
          body: SizedBox.expand(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const <Widget>[
                HomeScreen(),
                CommunityScreen(),
                ProfileScreen(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'home'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.groups),
                label: 'community'.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2),
                label: 'profile'.tr(),
              ),
            ],
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}
