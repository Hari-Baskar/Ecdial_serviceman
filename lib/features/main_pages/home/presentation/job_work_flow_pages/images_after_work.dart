import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/button.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

class ImagesAfterWork extends HookConsumerWidget {
  final VoidCallback onConfirmed;

  const ImagesAfterWork({super.key, required this.onConfirmed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int maxImages = 5;
    final images = useState<List<File>>([]);
    final picker = useMemoized(() => ImagePicker());
    Future<void> pickImages() async {
      if (images.value.length >= maxImages) return;

      final picked = await picker.pickMultiImage();
      if (picked.isEmpty) return;

      final remaining = maxImages - images.value.length;

      images.value = [
        ...images.value,
        ...picked.take(remaining).map((e) => File(e.path)),
      ];
    }

    return Padding(
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text("Upload After Images", style: AppTextStyles.body(context)),
          SizedBox(height: AppSpacing.h8),
          Text(
            "Take photos after completing the work (mandatory for some services).",
            style: AppTextStyles.body(context, color: AppColors.secondaryText),
          ),

          SizedBox(height: AppSpacing.h32),
          Wrap(
            spacing: AppSpacing.w8,
            runSpacing: AppSpacing.w4,
            children: [
              for (var i in images.value) ...[imageContainer(img: i)],
              pickImageWidget(pickImages),
            ],
          ),
          SizedBox(height: AppSpacing.h32),
          AppButton(
            content: Text(
              "Continue",
              style: AppTextStyles.body(context, color: AppColors.white),
            ),

            onTap: onConfirmed,
            buttonColor: AppColors.orangetheme,
          ),
        ],
      ),
    );
  }

  Widget pickImageWidget(Future<void> Function() pickImages) {
    return DottedBorder(
      options: RectDottedBorderOptions(
        dashPattern: [10, 5],
        strokeWidth: 2,
        padding: EdgeInsets.all(16),
      ),
      child: GestureDetector(
        onTap: pickImages,
        child: Container(
          height: AppSize.height * 0.1,
          width: AppSize.height * 0.1,
          alignment: Alignment.center,
          child: const Icon(
            Icons.camera_alt_outlined,
            color: Colors.grey,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget imageContainer({required File img}) {
    return SizedBox(
      height: AppSize.width * 0.3,
      width: AppSize.width * 0.3,
      child: Image.file(img, fit: BoxFit.cover),
    );
  }
}
