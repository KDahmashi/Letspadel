import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:flutter/material.dart';

class GroupCommunity extends StatelessWidget {
  const GroupCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 2,
              shadowColor: context.theme.primaryColor,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.group,
                      size: 50,
                      color: context.theme.primaryColor,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'your_not_member'.tr(),
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'dont_hesitate_create'.tr(),
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.theme.colorScheme.outlineVariant,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      icon: Icon(Icons.add),
                      onPressed: () {},
                      label: Text('new_group'.tr()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
