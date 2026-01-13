import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/button.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

class ConfirmArrivalStep extends HookConsumerWidget {
  final VoidCallback onConfirmed;

  const ConfirmArrivalStep({super.key, required this.onConfirmed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 70.sp,
            backgroundColor: AppColors.lightBlue.withOpacity(0.2),
            child: Icon(
              Icons.location_on_outlined,
              size: 70.sp,
              color: AppColors.lightBlue,
            ),
          ),
          SizedBox(height: AppSpacing.h24),
          Text("Confirm Arrival", style: AppTextStyles.heading(context)),
          SizedBox(height: AppSpacing.h8),
          Text(
            "Confirm that you have arrived at the customer location to proceed.",
            textAlign: TextAlign.center,
            style: AppTextStyles.body(context, color: AppColors.secondaryText),
          ),

          SizedBox(height: AppSpacing.h32),

          AppButton(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline, color: AppColors.white),
                SizedBox(width: AppSpacing.w8),
                Text(
                  "Confirm Arrival",
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
