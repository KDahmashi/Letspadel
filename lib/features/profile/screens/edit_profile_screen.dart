import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import '../../../core/usecases/constants.dart';
import '../../../generated/assets.dart';
import 'package:flutter/material.dart';



class EditProfileScreen extends StatefulWidget {
  static String routeName = 'EditProfileScreen';

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _nameController.text = auth.currentUser?.displayName ?? '';
    _emailController.text = auth.currentUser?.email ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      auth.currentUser?.updateProfile(
        displayName: _nameController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'profile_saved_successfully'.tr(),
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.theme.colorScheme.surface,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'edit_profile'.tr(),
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.theme.colorScheme.onPrimary,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    Assets.imagesDefaultUser,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
                decoration: InputDecoration(
                  labelText: 'full_name'.tr(),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'field_required'.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
                decoration: InputDecoration(
                  labelText: 'email'.tr(),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'field_required'.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveProfile,
                child: Text('save'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
