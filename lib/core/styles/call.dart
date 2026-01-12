import 'package:flutter/material.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/radius.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

call({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: AppColors.orangetheme,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.w12,
        vertical: AppSpacing.h8,
      ),
      child: Row(
        children: [
          Icon(
            Icons.phone_outlined,
            size: AppSize.width * 0.05,
            color: AppColors.white,
          ),
          Text(
            "Call",
            style: AppTextStyles.small(context, color: AppColors.white),
          ),
        ],
      ),
    ),
  );
}
