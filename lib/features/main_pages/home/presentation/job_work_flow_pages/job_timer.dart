import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/button.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

class JobTimer extends HookConsumerWidget {
  final VoidCallback onConfirmed;

  const JobTimer({super.key, required this.onConfirmed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 70.sp,
            backgroundColor: AppColors.green.withOpacity(0.2),
            child: Icon(
              Icons.watch_later_outlined,
              size: 70.sp,
              color: AppColors.green,
            ),
          ),
          SizedBox(height: AppSpacing.h24),
          Text("Start Job Timer", style: AppTextStyles.body(context)),
          SizedBox(height: AppSpacing.h8),
          Text(
            "Start the timer to track job duration.",
            style: AppTextStyles.body(context, color: AppColors.secondaryText),
          ),

          SizedBox(height: AppSpacing.h32),

          AppButton(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.watch_later_outlined, color: AppColors.white),
                SizedBox(width: AppSpacing.w8),
                Text(
                  "Start Timer",
                  style: AppTextStyles.body(context, color: AppColors.white),
                ),
              ],
            ),
            onTap: onConfirmed,
            buttonColor: AppColors.orangetheme,
          ),
        ],
      ),
    );
  }
}
