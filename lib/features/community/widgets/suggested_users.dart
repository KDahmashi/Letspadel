import 'package:padel/features/community/widgets/user_card.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import '../../../generated/assets.dart';
import 'package:flutter/material.dart';



class SuggestedUsers extends StatefulWidget {
  const SuggestedUsers({super.key});

  @override
  State<SuggestedUsers> createState() => _SuggestedUsersState();
}

class _SuggestedUsersState extends State<SuggestedUsers> {

  List<String> friends = [];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SizedBox(
        width: context.screenSize.width,
        height: 190,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            const SizedBox(width: 12),
            UserCard(
              name: 'Ale Galán',
              imageUrl: Assets.imagesPlayer1,
              friends: friends,
              onPressed: () {
                setState(() {
                  friends.add('Ale Galán');
                });
              },
            ),
            UserCard(
              name: 'Ahmer',
              imageUrl: Assets.imagesPlayer1,
              friends: friends,
              onPressed: () {
                setState(() {
                  friends.add('Ahmer');
                });
              },
            ),
            UserCard(
              name: 'Jad M',
              imageUrl: Assets.imagesPlayer1,
              friends: friends,
              onPressed: () {
                setState(() {
                  friends.add('Jad M');
                });
              },
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
