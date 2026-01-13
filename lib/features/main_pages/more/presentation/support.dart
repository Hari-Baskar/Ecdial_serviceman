import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

class Support extends HookConsumerWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Support", style: AppTextStyles.body(context)),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.w16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text("ecdial425@gmail.com", style: AppTextStyles.body(context)),
            SizedBox(height: AppSpacing.h8, width: AppSize.width),
            Text("+91 9876543210", style: AppTextStyles.body(context)),
          ],
        ),
      ),
    );
  }
}
