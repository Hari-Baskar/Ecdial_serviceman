import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/radius.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

enum AppButtonType { primary, secondary }

class AppButton extends StatelessWidget {
  final String text;
  final double? width;
  final Color? buttonColor;
  final Color? textColor;
  final AppButtonType type;
  final VoidCallback onTap;

  const AppButton({
    super.key,
    this.width,
    this.buttonColor,
    this.textColor,
    required this.text,
    required this.onTap,
    this.type = AppButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(AppRadius.r12),
        ),
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.w12,
          horizontal: AppSpacing.w12,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.body(context).copyWith(
              fontWeight: FontWeight.w400,
              color: textColor ?? AppColors.white,
              fontSize: 13.sp, // Looks better and modern
            ),
          ),
        ),
      ),
    );
  }
}
