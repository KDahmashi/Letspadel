import 'package:padel/features/community/widgets/suggested_users.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:flutter/material.dart';


class FeedCommunity extends StatelessWidget {
  const FeedCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
                        'get_notified_ahead'.tr().toUpperCase(),
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
                        'get_notified_des'.tr(),
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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'suggested_for_you'.tr(),
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SuggestedUsers(),

          const SizedBox(height: 22),
        ],
      ),
    );
  }
}
