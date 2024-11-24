import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final List<String> friends;
  final VoidCallback onPressed;

  const UserCard({
    super.key,
    required this.onPressed,
    required this.name,
    required this.friends,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Card(
        color: context.theme.colorScheme.surface,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              child: Image.asset(
                imageUrl,
                height: 100,
                width: context.screenSize.width / 3,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 6),
            Text(
              name,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (friends.contains(name))
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'following'.tr(),
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.theme.colorScheme.primary,
                  ),
                ),
              )
            else
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  minimumSize: const Size(
                    90,
                    30,
                  ),
                ),
                onPressed: () => onPressed(),
                child: Text(
                  'follow'.tr(),
                  style: context.textTheme.bodySmall,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
