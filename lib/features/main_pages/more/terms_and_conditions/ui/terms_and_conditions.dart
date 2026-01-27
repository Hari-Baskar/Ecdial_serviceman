import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/themes/app_colors.dart';

import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';
import 'package:jobs_app/features/main_pages/more/terms_and_conditions/state/terms_provider.dart';
import 'package:jobs_app/features/main_pages/more/terms_and_conditions/state/terms_state.dart';

class TermsAndConditions extends HookConsumerWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() {
        ref.read(termsNotifierProvider.notifier).fetchTerms();
      });

      return null;
    }, []);
    final termsAsync = ref.watch(termsNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Terms & Conditions", style: AppTextStyles.body(context)),
        ),
        body: termsAsync.when(
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
          data: (terms) => Padding(
            padding: EdgeInsets.all(AppSpacing.w16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Html(
                    data: terms,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
