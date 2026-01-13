import 'package:flutter/material.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/radius.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

wrappedText({
  required BuildContext context,
  required String text,
  required Color textColor,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: textColor.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.w12),
      child: Text(text, style: AppTextStyles.small(context, color: textColor)),
    ),
  );
}

inProgress({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: AppColors.bluetheme.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.w8,
        vertical: AppSpacing.w4,
      ),
      child: Text(
        "In Progress",
        style: AppTextStyles.small(context, color: AppColors.bluetheme),
      ),
    ),
  );
}

completed({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: AppColors.green.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.w8,
        vertical: AppSpacing.w4,
      ),
      child: Text(
        "Completed",
        style: AppTextStyles.small(context, color: AppColors.green),
      ),
    ),
  );
}

assigned({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: AppColors.orangetheme.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.w8,
        vertical: AppSpacing.w4,
      ),
      child: Text(
        "Assigned",
        style: AppTextStyles.small(context, color: AppColors.orangetheme),
      ),
    ),
  );
}

processing({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: AppColors.yellow.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.w8,
        vertical: AppSpacing.w4,
      ),
      child: Text(
        "Processing",
        style: AppTextStyles.small(context, color: AppColors.darkOrange),
      ),
    ),
  );
}

present({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: AppColors.green.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.w8,
        vertical: AppSpacing.w4,
      ),
      child: Text(
        "Present",
        style: AppTextStyles.small(context, color: AppColors.green),
      ),
    ),
  );
}

absent({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: AppColors.red.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.w8,
        vertical: AppSpacing.w4,
      ),
      child: Text(
        "Absent",
        style: AppTextStyles.small(context, color: AppColors.red),
      ),
    ),
  );
}

viewAll({required BuildContext context}) {
  return Text(
    "View All ➜",
    style: AppTextStyles.small(context, color: AppColors.orangetheme),
  );
}
