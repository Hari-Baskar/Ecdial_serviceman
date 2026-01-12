import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/styles/call.dart';
import 'package:jobs_app/core/styles/decoration.dart';
import 'package:jobs_app/core/styles/wrapped_text.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/button.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

class JobDetails extends HookConsumerWidget {
  const JobDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          headers(context: context),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(AppSpacing.w16),
              children: [
                customerDetails(context: context),
                SizedBox(height: AppSpacing.h8),
                serviceDetails(context: context),
                SizedBox(height: AppSpacing.h8),
                problemDescription(
                  context: context,
                  title: "Problem Description",
                  content:
                      "The AC is not cooling properly and the compressor is making unusual noise. Customer mentioned it started 2 days ago.",
                ),
                SizedBox(height: AppSpacing.h8),
                locationAndTiming(context: context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget headers({required BuildContext context}) {
    return Card(
      color: AppColors.white,
      elevation: 0.2,
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.w16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSpacing.h16),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back_rounded),
                ),
                SizedBox(width: AppSpacing.w16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Job Details", style: AppTextStyles.body(context)),
                    Text(
                      "Job ID: 123456",
                      style: AppTextStyles.body(context, color: AppColors.grey),
                    ),
                  ],
                ),
                Spacer(),
                assigned(context: context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customerDetails({required BuildContext context}) {
    return Container(
      decoration: getCardDecoration(context: context),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Customer Details", style: AppTextStyles.body(context)),
          SizedBox(height: AppSpacing.h8),
          Row(
            children: [
              Text('Rajesh Kumar', style: AppTextStyles.body(context)),
              Spacer(),
              call(context: context),
            ],
          ),
          SizedBox(height: AppSpacing.h8),
          Row(
            children: [
              Icon(Icons.phone_outlined, color: AppColors.secondaryText),
              SizedBox(width: AppSpacing.w8),
              Text(
                '+91 9876543210',
                style: AppTextStyles.body(
                  context,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.h8),
          Row(
            children: [
              Icon(Icons.email_outlined, color: AppColors.secondaryText),
              SizedBox(width: AppSpacing.w8),
              Text(
                'rajeshkumar@gmail.com',
                style: AppTextStyles.body(
                  context,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget serviceDetails({required BuildContext context}) {
    return Container(
      decoration: getCardDecoration(context: context),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Service Details", style: AppTextStyles.body(context)),
          SizedBox(height: AppSpacing.h8),
          serviceDetailsFields(
            context: context,
            title: "Service Type",
            content: "AC Repair",
          ),
          SizedBox(height: AppSpacing.h12),
          serviceDetailsFields(
            context: context,
            title: "Description",
            content:
                "Split AC not cooling properly. Compressor making unusual noise.",
          ),
          SizedBox(height: AppSpacing.h12),
          serviceDetailsFields(
            context: context,
            title: "SLA",
            content: "2 hours",
          ),
        ],
      ),
    );
  }

  serviceDetailsFields({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.body(context, color: AppColors.secondaryText),
        ),
        SizedBox(height: AppSpacing.h2),
        Text(content, style: AppTextStyles.body(context)),
      ],
    );
  }

  problemDescription({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return Container(
      decoration: getCardDecoration(context: context),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.body(context)),
          SizedBox(height: AppSpacing.h8),
          Text(
            content,
            style: AppTextStyles.body(context, color: AppColors.secondaryText),
          ),
        ],
      ),
    );
  }

  Widget locationAndTiming({required BuildContext context}) {
    return Container(
      decoration: getCardDecoration(context: context),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Location", style: AppTextStyles.body(context)),
          SizedBox(height: AppSpacing.h8),
          Row(
            children: [
              Icon(Icons.location_on, color: AppColors.secondaryText),
              SizedBox(width: AppSpacing.w8),
              Text(
                "Chennai, 600028",
                style: AppTextStyles.body(
                  context,

                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.h8),
          Row(
            children: [
              Icon(Icons.access_time, color: AppColors.secondaryText),
              SizedBox(width: AppSpacing.w8),
              Text(
                '10:00 AM - 11:00 AM',
                style: AppTextStyles.body(
                  context,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.h8),
          AppButton(
            text: 'Get Direction',
            onTap: () {},
            buttonColor: AppColors.lightBlue,
          ),
        ],
      ),
    );
  }
}
