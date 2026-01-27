import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';

Future<ImageSource?> showImageSourceSheet(BuildContext context) async {
  return showModalBottomSheet<ImageSource>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) {
      return SafeArea(
        child: IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.w32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context, ImageSource.camera),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt),
                        SizedBox(width: AppSpacing.w8),
                        Text("Camera"),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(
                  width: AppSpacing.w16,
                  thickness: 1,
                  color: AppColors.grey,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context, ImageSource.gallery),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo_library),
                        SizedBox(width: AppSpacing.w8),
                        Text("Gallery"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
