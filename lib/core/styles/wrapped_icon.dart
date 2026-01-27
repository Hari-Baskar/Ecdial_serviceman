// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/radius.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';

wrappedIcon({
  required BuildContext context,
  required IconData icon,
  required Color iconColor,
  double? iconSize,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),

      color: iconColor.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.w12),
      child: Icon(icon, color: iconColor, size: iconSize),
    ),
  );
}

workIcon({required BuildContext context, Color? color, double? iconSize}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: color != null
          ? color.withOpacity(0.15)
          : AppColors.orangetheme.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.w8),
      child: Icon(
        Icons.business_center_outlined,
        size: iconSize,
        color: color != null ? color : AppColors.orangetheme,
      ),
    ),
  );
}

presentIcon({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: AppColors.green.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.w8),
      child: Icon(Icons.check_circle_outline, color: AppColors.green),
    ),
  );
}

absentIcon({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: AppColors.red.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.w8),
      child: Icon(Icons.cancel, color: AppColors.red),
    ),
  );
}

calendarIcon({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: AppColors.blue.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.w8),
      child: Icon(Icons.calendar_month_outlined, color: AppColors.blue),
    ),
  );
}

withdrawIcon({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: AppColors.orangetheme.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.w12),
      child: Icon(Icons.call_made, color: AppColors.orangetheme),
    ),
  );
}

payoutReceivedIcon({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: AppColors.green.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.w12),
      child: Icon(Icons.call_received, color: AppColors.green),
    ),
  );
}

moneyIcon({required BuildContext context, Color? color, double? iconSize}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: color != null
          ? color.withOpacity(0.15)
          : AppColors.white.withOpacity(0.4),
    ),
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.w8),
      child: Icon(
        Icons.currency_rupee_rounded,
        color: color != null ? color : AppColors.white,
      ),
    ),
  );
}

pendingIcon({required BuildContext context, Color? color, double? iconSize}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: color != null
          ? color.withOpacity(0.15)
          : AppColors.bluetheme.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.w8),
      child: Icon(
        Icons.trending_up,
        color: color != null ? color : AppColors.bluetheme,
      ),
    ),
  );
}

bonusIcon({required BuildContext context, Color? color, double? iconSize}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: AppColors.orangetheme.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.w8),
      child: Icon(Icons.card_giftcard, color: AppColors.orangetheme),
    ),
  );
}

thisMonthIcon({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppRadius.r16),
      color: AppColors.green.withOpacity(0.15),
    ),
    child: Padding(
      padding: EdgeInsets.all(AppSpacing.w8),
      child: Icon(
        Icons.account_balance_wallet_outlined,
        color: AppColors.green,
      ),
    ),
  );
}
