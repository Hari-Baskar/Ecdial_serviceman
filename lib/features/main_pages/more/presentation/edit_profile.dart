import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';
import 'package:jobs_app/core/widgets/text_field.dart';

class EditProfile extends HookConsumerWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile", style: AppTextStyles.body(context)),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.w16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppSpacing.h16),
              AppTextField(controller: nameController, hint: "Name"),
            ],
          ),
        ),
      ),
    );
  }
}
