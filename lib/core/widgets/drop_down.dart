import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/radius.dart';
import 'package:jobs_app/core/widgets/text.dart';

class AppDropDown extends StatelessWidget {
  final String label;
  final List items;
  final String? value;
  final Function(String?) onChanged;

  const AppDropDown({
    super.key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      initialValue: value,
      decoration: InputDecoration(
        label: Text(
          label,
          style: AppTextStyles.body(context, color: AppColors.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.r16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
          borderRadius: BorderRadius.circular(AppRadius.r12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.bluetheme),
          borderRadius: BorderRadius.circular(AppRadius.r12),
        ),
      ),

      items: items
          .map(
            (e) => DropdownMenuItem(
              value: e.toString(),
              child: Text(
                e,
                style: AppTextStyles.body(context, fontSize: 14.sp),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
