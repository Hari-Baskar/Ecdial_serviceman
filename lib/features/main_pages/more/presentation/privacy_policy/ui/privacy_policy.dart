import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';
import 'package:jobs_app/features/main_pages/more/presentation/privacy_policy/state/privacy_policy_provider.dart';
import 'package:jobs_app/features/main_pages/more/presentation/privacy_policy/state/privacy_policy_state.dart';

class PrivacyPolicy extends HookConsumerWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() {
        ref.read(privacyPolicyNotifierProvider.notifier).fetchPrivacyPolicy();
      });
      //ref.read(privacyPolicyNotifierProvider.notifier).fetchPrivacyPolicy();

      return null; // no dispose
    }, const []);
    final privacyPolicyState = ref.watch(privacyPolicyNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Privacy Policy", style: AppTextStyles.body(context)),
        ),
        body: privacyPolicyState.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.orangetheme),
          ),
          error: (err) => Center(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.w16),
              child: Text(
                err.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          data: (privacyPolicy) => Padding(
            padding: EdgeInsets.all(AppSpacing.w16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Html(
                    data: privacyPolicy,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
