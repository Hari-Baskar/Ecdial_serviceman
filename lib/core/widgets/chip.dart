import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/radius.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

class AppChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const AppChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: AppSpacing.w8,
            horizontal: AppSpacing.w12,
          ),
          //margin: EdgeInsets.only(right: AppSpacing.w8),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.bluetheme
                : AppColors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(AppRadius.r16),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: AppTextStyles.body(
              context,
              fontSize: 12.sp,
              color: selected ? AppColors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
