import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/styles/decoration.dart';
import 'package:jobs_app/core/styles/wrapped_icon.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/radius.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

class Notifications extends HookConsumerWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          headers(context: context),
          Expanded(
            // 🔥 REQUIRED
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.w16),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return notificationCard(context: context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headers({required BuildContext context}) {
    return Card(
      color: AppColors.white,
      elevation: 0.2,
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.w16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSpacing.h16),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back_rounded),
                ),
                SizedBox(width: AppSpacing.w16),
                Text("Notifications", style: AppTextStyles.body(context)),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.orangetheme,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(AppSpacing.w8),
                  child: Text(
                    "2",
                    style: AppTextStyles.body(context, color: AppColors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.h12),
            // showProfile(context: context),
            Text(
              "Mark All as read",
              style: AppTextStyles.body(context, color: AppColors.orangetheme),
            ),
          ],
        ),
      ),
    );
  }

  Widget notificationCard({required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.r16),
        border: Border(
          left: BorderSide(color: AppColors.orangetheme, width: AppSpacing.w4),
        ),

        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.04), // LIGHT shadow
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(AppSpacing.w16),
      margin: EdgeInsets.symmetric(vertical: AppSpacing.h4),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // circularWrappedIcon(
          //   context: context,
          //   icon: Icons.work_outline,
          //   iconColor: const Color.fromRGBO(3, 169, 244, 1),
          // ),
          // circularWrappedIcon(
          //   context: context,
          //   icon: Icons.error_outline,
          //   iconColor: AppColors.orangetheme,
          // ),
          circularWrappedIcon(
            context: context,
            icon: Icons.currency_rupee,
            iconColor: AppColors.green,
          ),
          SizedBox(width: AppSpacing.w16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("title", style: AppTextStyles.body(context)),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.delete_outlined, color: AppColors.grey),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.h4),

                Text(
                  "You have been assigned a new AC Repair job for tomorrow.",
                  style: AppTextStyles.body(context),
                ),
                SizedBox(height: AppSpacing.h4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "5 mins ago",
                      style: AppTextStyles.small(
                        context,
                        color: AppColors.grey,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.circle,
                        color: AppColors.orangetheme,
                        size: AppSize.width * 0.02,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  circularWrappedIcon({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        color: iconColor.withOpacity(0.15),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.w8),
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
