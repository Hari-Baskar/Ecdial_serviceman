import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/Widgets/button.dart';
import 'package:jobs_app/core/router/app_routes.dart';
import 'package:jobs_app/core/styles/decoration.dart';
import 'package:jobs_app/core/styles/wrapped_icon.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/radius.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

class Settings extends HookConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text('Settings', style: AppTextStyles.body(context)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(AppSpacing.w16),
              children: [
                subWidget(
                  context: context,
                  icon: Icons.language_outlined,
                  iconColor: AppColors.blue,
                  title: 'Language',
                  subtitle: 'English',
                ),
                SizedBox(height: AppSpacing.h8),
                subWidget(
                  context: context,
                  icon: Icons.error_outline,
                  iconColor: AppColors.purple,
                  title: 'About App',
                  subtitle: 'version 1.0.0',
                ),
                SizedBox(height: AppSpacing.h8),
                termsAndPolicy(context: context),
                SizedBox(height: AppSpacing.h8),
                appInformation(context: context),
                SizedBox(height: AppSpacing.h12),
                AppButton(
                  content: Text(
                    "Logout",
                    style: AppTextStyles.body(context, color: AppColors.white),
                  ),
                  onTap: () {},
                  buttonColor: AppColors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget subWidget({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      decoration: getCardDecoration(context: context),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Row(
        children: [
          wrappedIcon(
            icon: icon,
            iconColor: iconColor,
            context: context,
            iconSize: AppSize.width * 0.07,
          ),
          SizedBox(width: AppSpacing.w16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.body(context)),
              Text(
                subtitle,
                style: AppTextStyles.body(
                  context,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_sharp,
            size: AppSize.width * 0.04,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }

  Widget termsAndPolicy({required BuildContext context}) {
    return Container(
      decoration: getCardDecoration(context: context),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              context.push(AppRoutes.termsAndConditions);
            },
            child: Row(
              children: [
                wrappedIcon(
                  icon: Icons.description_outlined,
                  iconColor: AppColors.green,
                  context: context,
                  iconSize: AppSize.width * 0.07,
                ),
                SizedBox(width: AppSpacing.w16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Terms & Conditions",
                      style: AppTextStyles.body(context),
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: AppSize.width * 0.04,
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
          Divider(height: AppSpacing.h24, color: AppColors.lightGrey),
          InkWell(
            onTap: () {
              context.push(AppRoutes.privacyPolicy);
            },
            child: Row(
              children: [
                wrappedIcon(
                  icon: Icons.shield_outlined,
                  iconColor: AppColors.orangetheme,
                  context: context,
                  iconSize: AppSize.width * 0.07,
                ),
                SizedBox(width: AppSpacing.w16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Privacy Policy", style: AppTextStyles.body(context)),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: AppSize.width * 0.04,
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appInformation({required BuildContext context}) {
    return Container(
      decoration: getCardDecoration(context: context),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("App Information", style: AppTextStyles.body(context)),
          SizedBox(height: AppSpacing.h6),
          appInformationSubWidget(
            context: context,
            title: "version",
            value: "1.0.0",
          ),
          SizedBox(height: AppSpacing.h6),
          appInformationSubWidget(
            context: context,
            title: "Build",
            value: "100",
          ),
          SizedBox(height: AppSpacing.h6),
          appInformationSubWidget(
            context: context,
            title: "Last Updated",
            value: "Nov 2024",
          ),
        ],
      ),
    );
  }

  appInformationSubWidget({
    required String title,
    required String value,
    required BuildContext context,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.body(context, color: AppColors.secondaryText),
        ),
        Text(value, style: AppTextStyles.body(context)),
      ],
    );
  }
}
