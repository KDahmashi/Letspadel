import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:padel/features/home/widgets/padel_preference.dart';



class PlayerPreferences extends StatefulWidget {
  static String routeName = 'PlayerPreferences';
  const PlayerPreferences({super.key});

  @override
  _PlayerPreferencesState createState() => _PlayerPreferencesState();
}

class _PlayerPreferencesState extends State<PlayerPreferences> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: context.theme.primaryColor,
          title: Text(
            'player_preferences'.tr(),
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => context.pop(),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text('padel'.tr(),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              Tab(
                child: Text('tennis'.tr(),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PadelPreference(),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
