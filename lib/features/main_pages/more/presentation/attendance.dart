import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/Widgets/text.dart';
import 'package:jobs_app/core/styles/decoration.dart';
import 'package:jobs_app/core/styles/wrapped_icon.dart';
import 'package:jobs_app/core/styles/wrapped_text.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/button.dart';
import 'package:jobs_app/core/widgets/radius.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:custom_calendar_viewer/custom_calendar_viewer.dart';

class Attendance extends HookConsumerWidget {
  const Attendance({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance", style: AppTextStyles.body(context)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(AppSpacing.w16),
              children: [
                punchInOut(context: context),
                SizedBox(height: AppSpacing.h8),
                thisMonthAttendance(context: context),
                SizedBox(height: AppSpacing.h8),
                CalendarCard(),
                SizedBox(height: AppSpacing.h8),
                recentAttendance(context: context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget punchInOut({required BuildContext context}) {
    return Container(
      decoration: getCardDecoration(context: context),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Today's Status", style: AppTextStyles.body(context)),
              Spacer(),
              Icon(Icons.access_time, color: AppColors.secondaryText),
              SizedBox(width: AppSpacing.w8),
              Text(
                'Jan 13',
                style: AppTextStyles.body(
                  context,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.h8),
          punchedInWithTime(context: context),
          SizedBox(height: AppSpacing.h8),
          AppButton(
            content: Text(
              "Punch Out",
              style: AppTextStyles.body(context, color: AppColors.white),
            ),
            onTap: () {},
            buttonColor: AppColors.red,
          ),
        ],
      ),
    );
  }

  Widget punchedInWithTime({required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r16),
        color: AppColors.green.withOpacity(0.1),
        border: Border.all(color: AppColors.green),
      ),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.access_time, color: AppColors.green),
              SizedBox(width: AppSpacing.w8),
              Text(
                "Punched In",
                style: AppTextStyles.body(context, color: AppColors.green),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.h6),
          Text(
            "Since 04:20 PM",
            style: AppTextStyles.body(context, color: AppColors.green),
          ),
        ],
      ),
    );
  }

  Widget thisMonthAttendance({required BuildContext context}) {
    return Container(
      decoration: getCardDecoration(context: context),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("This Month", style: AppTextStyles.body(context)),
          SizedBox(height: AppSpacing.h8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              thisMonthAttendanceSubWidget(
                context: context,
                title: "Present",
                count: 24.toString(),
                iconWidget: presentIcon(context: context),
              ),
              thisMonthAttendanceSubWidget(
                context: context,
                title: "Absent",
                count: 2.toString(),
                iconWidget: absentIcon(context: context),
              ),
              thisMonthAttendanceSubWidget(
                context: context,
                title: "Leave",
                count: 3.toString(),
                iconWidget: calendarIcon(context: context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget thisMonthAttendanceSubWidget({
    required BuildContext context,
    required dynamic iconWidget,
    required String title,
    required String count,
  }) {
    return Column(
      children: [
        iconWidget,
        SizedBox(height: AppSpacing.h6),
        Text(count, style: AppTextStyles.body(context)),
        SizedBox(height: AppSpacing.h2),
        Text(
          title,
          style: AppTextStyles.body(context, color: AppColors.secondaryText),
        ),
      ],
    );
  }

  Widget recentAttendance({required BuildContext context}) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.w16),
      decoration: getCardDecoration(context: context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recent Attendance", style: AppTextStyles.body(context)),
          SizedBox(height: AppSpacing.h8),
          recentAttendanceSubWidget(context: context, title: "Jan 2"),
          Divider(height: AppSpacing.h24, color: AppColors.lightGrey),
          recentAttendanceSubWidget(
            context: context,
            title: "Jan 2",
            subtitle: "09:10 AM - 06:45 PM",
          ),
        ],
      ),
    );
  }

  Widget recentAttendanceSubWidget({
    required BuildContext context,
    required String title,
    String? subtitle,
  }) {
    return Row(
      children: [
        if (subtitle != null) ...[
          presentIcon(context: context),
        ] else ...[
          absentIcon(context: context),
        ],
        SizedBox(width: AppSpacing.w16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.body(context)),
            if (subtitle != null) ...[
              Text(
                "09:10 AM - 06:45 PM",
                style: AppTextStyles.body(
                  context,
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ],
        ),

        Spacer(),
        if (subtitle != null) ...[
          present(context: context),
        ] else ...[
          absent(context: context),
        ],
      ],
    );
  }
}

class CalendarCard extends StatelessWidget {
  const CalendarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.w16),
      decoration: getCardDecoration(context: context),
      child: IntrinsicWidth(
        child: CustomCalendarViewer(
          calendarType: CustomCalendarType.view, // 🔒 read-only
          calendarStyle: CustomCalendarStyle.normal,
          headerMargin: EdgeInsets.zero,
          daysMargin: EdgeInsets.zero,
          addDatesMargin: EdgeInsets.zero,

          headerBackground: Colors.transparent,
          daysHeaderBackground: Colors.transparent,
          daysBodyBackground: Colors.transparent,

          showBorderAfterDayHeader: false,
          showCurrentDayBorder: true,

          showHeader: true,

          headerStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),

          dates: _dates(),

          calendarStartDay: CustomCalendarStartDay.sunday,
        ),
      ),
    );
  }

  /// 🔹 Custom colored days
  List<Date> _dates() {
    return [
      // 🔵 Blue (selected / highlighted)
      Date(
        date: DateTime(2026, 1, 10),
        color: AppColors.green.withOpacity(0.1),
        textColor: Colors.green,
      ),
      Date(
        date: DateTime(2024, 11, 20),
        color: Colors.blue.shade100,
        textColor: Colors.blue,
      ),
      Date(
        date: DateTime(2024, 11, 30),
        color: Colors.blue.shade100,
        textColor: Colors.blue,
      ),

      // 🔴 Red (Sundays / blocked)
      Date(
        date: DateTime(2024, 11, 7),
        color: Colors.red.shade100,
        textColor: Colors.red,
      ),
      Date(
        date: DateTime(2024, 11, 14),
        color: Colors.red.shade100,
        textColor: Colors.red,
      ),
      Date(
        date: DateTime(2024, 11, 21),
        color: Colors.red.shade100,
        textColor: Colors.red,
      ),
      Date(
        date: DateTime(2024, 11, 28),
        color: Colors.red.shade100,
        textColor: Colors.red,
      ),
    ];
  }
}
