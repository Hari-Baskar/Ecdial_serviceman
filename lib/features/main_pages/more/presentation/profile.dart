import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/styles/decoration.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/button.dart';
import 'package:jobs_app/core/widgets/image_picker_common.dart/image_picker_service.dart';
import 'package:jobs_app/core/widgets/image_picker_common.dart/image_picker_source_select.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';
import 'package:jobs_app/core/widgets/text_field.dart';

class Profile extends HookConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final images = useState<List<File>>([]);
    Future<void> addImages() async {
      final source = await showImageSourceSheet(context);
      if (source == null) return;

      final picked = await AppImagePicker.pick(source: source, multiple: false);

      final remaining = 5 - images.value.length;

      images.value = [...images.value, ...picked.take(remaining)];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: AppTextStyles.body(context)),
        actions: [
          IconButton(
            onPressed: () {
              editDetails(context: context, nameController: nameController);
            },
            icon: Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(AppSpacing.w16),
              children: [
                basicProfileDetails(context: context, onImagePick: addImages),
                SizedBox(height: AppSpacing.h16),
                jobsAndExperience(context: context),
                SizedBox(height: AppSpacing.h16),
                otherDetails(context: context),
                SizedBox(height: AppSpacing.h16),

                //  allProfileWidgets(context: context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget basicProfileDetails({
    required BuildContext context,
    required VoidCallback onImagePick,
  }) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: AppSize.width * 0.135,
              backgroundColor: AppColors.orangetheme,
              child: CircleAvatar(
                radius: AppSize.width * 0.13,
                backgroundImage: AssetImage("assets/splash/splash1.png"),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: onImagePick,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.orangetheme,
                  ),
                  padding: EdgeInsets.all(AppSpacing.w4),
                  child: Icon(Icons.image_outlined, color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.h8),
        Text("John Doe", style: AppTextStyles.subtitle(context)),
        SizedBox(height: AppSpacing.h8),
        Text(
          "JOb966",
          style: AppTextStyles.body(context, color: AppColors.secondaryText),
        ),
      ],
    );
  }

  Widget jobsAndExperience({required BuildContext context}) {
    return Container(
      decoration: getCardDecoration(context: context),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("847", style: AppTextStyles.subtitle(context)),
                  Text(
                    "Jobs Completed",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body(
                      context,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),

            VerticalDivider(
              width: AppSpacing.w32,
              thickness: 1,
              color: AppColors.grey,
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("5 years", style: AppTextStyles.subtitle(context)),
                  Text(
                    "Experience",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body(
                      context,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  otherDetails({required BuildContext context}) {
    return Container(
      decoration: getCardDecoration(context: context),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        children: [
          otherDetailsSubWidget(
            context: context,
            icon: Icons.location_on_outlined,
            title: "Branch",
            content: "Pollachi",
          ),
          SizedBox(height: AppSpacing.h16),
          otherDetailsSubWidget(
            context: context,
            icon: Icons.description_outlined,
            title: "Aadhaar",
            content: "1234 5678 9012",
          ),
          SizedBox(height: AppSpacing.h16),
          otherDetailsSubWidget(
            context: context,
            icon: Icons.calendar_month_outlined,
            title: "Joined",
            content: "12-08-2020",
          ),
        ],
      ),
    );
  }

  otherDetailsSubWidget({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.grey),
        SizedBox(width: AppSpacing.w16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.body(
                context,
                color: AppColors.secondaryText,
              ),
            ),
            Text(
              content,
              textAlign: TextAlign.center,
              style: AppTextStyles.body(context),
            ),
          ],
        ),
      ],
    );
  }

  editDetails({
    required BuildContext context,
    required TextEditingController nameController,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.all(AppSpacing.w16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Edit Details", style: AppTextStyles.body(context)),
                SizedBox(height: AppSpacing.h16),
                AppTextField(controller: nameController, hint: "Name"),
              ],
            ),
          ),
        );
      },
    );
  }
}
