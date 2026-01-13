import 'package:flutter/material.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/radius.dart';
import 'package:jobs_app/core/widgets/text.dart';

class AppTextField extends StatelessWidget {
  final String? hint;
  final String? label;
  final bool? readonly;
  final FocusNode? focusNode;
  final TextInputType? type;
  final void Function()? onTap;
  final int? minlines;
  final bool obscure;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? OnEditingComplete;

  const AppTextField({
    super.key,
    this.readonly,
    this.focusNode,
    this.type,
    this.obscure = false,
    this.suffix,
    this.prefix,
    this.prefixIcon,
    this.minlines,
    this.onTap,
    this.hint,
    this.label,
    required this.controller,
    this.OnEditingComplete,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      cursorColor: AppColors.bluetheme,
      controller: controller,
      onChanged: onChanged,
      keyboardType: type, // ✅ FIX ADDED
      minLines: minlines ?? 1,
      maxLines: obscure ? 1 : null,
      obscureText: obscure,
      readOnly: readonly ?? false,
      onTap: onTap,
      onEditingComplete: OnEditingComplete,

      decoration: InputDecoration(
        suffixIcon: suffix,

        prefix: prefixIcon,
        prefixIcon: prefix,
        hintText: hint,
        labelText: label,
        hintStyle: AppTextStyles.small(context, color: AppColors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.r12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(AppRadius.r12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.bluetheme),
          borderRadius: BorderRadius.circular(AppRadius.r12),
        ),
      ),
    );
  }
}
