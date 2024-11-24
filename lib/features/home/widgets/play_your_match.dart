import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:go_router/go_router.dart';
import '../../../generated/assets.dart';
import 'package:flutter/material.dart';
import '../screens/courts_screen.dart';


class PlayYourMatch extends StatelessWidget {
  const PlayYourMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'play_your_match'.tr(),
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => context.pushNamed(CourtsScreen.routeName),
                child: SizedBox(
                  width: context.screenSize.width / 2.2,
                  child: Card(
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                              child: Image.asset(
                                Assets.imagesMatch1,
                                height: 100,
                                width: context.screenSize.width / 2.2,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 36),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'book_court'.tr(),
                                    textAlign: TextAlign.start,
                                    style: context.textTheme.bodyMedium?.copyWith(
                                      color: context.theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'if_you_already_know'.tr(),
                                    style: context.textTheme.bodySmall?.copyWith(
                                      color: context.theme.colorScheme.outlineVariant,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 80,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: context.theme.primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: context.screenSize.width / 2.2,
                child: Card(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            ),
                            child: Image.asset(
                              Assets.imagesMatch2,
                              height: 100,
                              width: context.screenSize.width / 2.2,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 36),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'play_open_match'.tr(),
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: context.theme.colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'if_looking_players'.tr(),
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: context.theme.colorScheme.outlineVariant,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 80,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: context.theme.primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Icon(
                            Icons.sports_baseball,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.screenSize.width / 2.2,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 14,
                      right: 14,
                      left: 14,
                      top: 14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: context.theme.primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Icon(
                            MdiIcons.schoolOutline,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'classes'.tr(),
                          textAlign: TextAlign.start,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: context.screenSize.width / 2.2,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 14,
                      bottom: 14,
                      left: 14,
                      right: 14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: context.theme.primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Icon(
                            MdiIcons.shieldOutline,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'competitions'.tr(),
                          textAlign: TextAlign.start,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
