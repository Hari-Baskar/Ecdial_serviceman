import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/Widgets/screen_size.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/button.dart';
import 'package:jobs_app/core/widgets/radius.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';
import 'package:signature/signature.dart';

class CustomerSignature extends HookConsumerWidget {
  final VoidCallback onConfirmed;
  const CustomerSignature({required this.onConfirmed});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sign = SignatureController();
    return Padding(
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Customer Signature", style: AppTextStyles.body(context)),
          SizedBox(height: AppSpacing.h8),
          Text(
            "Get the customer's signature to confirm job completion.",
            style: AppTextStyles.body(context, color: AppColors.secondaryText),
          ),
          SizedBox(height: AppSpacing.h24),

          Container(
            height: AppSize.height * 0.3,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r16),
              border: Border.all(color: AppColors.black),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.r16),
              child: Signature(
                controller: sign,
                backgroundColor: AppColors.white,
              ),
            ),
          ),
          SizedBox(height: AppSpacing.h16),
          AppButton(
            content: Text("Clear", style: AppTextStyles.body(context)),

            onTap: () {
              sign.clear();
            },
            buttonColor: AppColors.lightGrey,
          ),
          SizedBox(height: AppSpacing.h32),
          AppButton(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.play_arrow_outlined, color: AppColors.white),
                SizedBox(width: AppSpacing.w8),
                Text(
                  "Complete Job",
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
