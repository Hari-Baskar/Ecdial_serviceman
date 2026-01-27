import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle splashHeading(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) => GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
  );
  static TextStyle heading(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) => GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
  );

  static TextStyle subtitle(
    BuildContext context, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) => GoogleFonts.poppins(
    fontSize: fontSize ?? 14.sp,
    fontWeight: FontWeight.w500,
    color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
  );

  static TextStyle body(
    BuildContext context, {
    Color? color,
    double? fontSize,
  }) => GoogleFonts.poppins(
    fontSize: fontSize ?? 13.sp,
    fontWeight: FontWeight.w400,
    color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
  );

  static TextStyle small(
    BuildContext context, {
    Color? color,
    double? fontSize,
  }) => GoogleFonts.poppins(
    fontSize: fontSize ?? 10.sp,
    fontWeight: FontWeight.w400,
    color: color ?? Theme.of(context).textTheme.bodySmall?.color,
  );
}
