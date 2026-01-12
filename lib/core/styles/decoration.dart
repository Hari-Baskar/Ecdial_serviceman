import 'package:flutter/material.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/radius.dart';

BoxDecoration getCardDecoration({required BuildContext context, Color? color}) {
  return BoxDecoration(
    color: color ?? AppColors.white, // Better DARK CARD for separation
    // LIGHT CARD
    borderRadius: BorderRadius.circular(AppRadius.r16),

    border: Border.all(
      color: Theme.of(
        context,
      ).dividerColor.withOpacity(0.06), // subtle white border
      width: 0.8,
    ),

    boxShadow: [
      BoxShadow(
        color: AppColors.black.withOpacity(0.04), // LIGHT shadow
        blurRadius: 8,
        offset: const Offset(0, 3),
      ),
    ],
  );
}
