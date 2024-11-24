import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import '../widgets/group_community.dart';
import '../widgets/feed_community.dart';
import 'package:flutter/material.dart';


class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen>
    with AutomaticKeepAliveClientMixin<CommunityScreen> {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: context.theme.primaryColor,
          title: SizedBox(
            height: 35,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: 'search_players'.tr(),
                isDense: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text('feed'.tr(),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              Tab(
                child: Text('groups'.tr(),
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
            FeedCommunity(),
            GroupCommunity(),
          ],
        ),
      ),
    );
  }
}
