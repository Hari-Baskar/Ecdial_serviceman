import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/button.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';
import 'package:jobs_app/core/widgets/text_field.dart';

/// ------------------------------------------------------------
/// 🔹 DATA MODEL (MUST BE TOP-LEVEL)
/// ------------------------------------------------------------
class ExtraChargeForm {
  final TextEditingController reason;
  final TextEditingController amount;

  ExtraChargeForm({required this.reason, required this.amount});
}

/// ------------------------------------------------------------
/// 🔹 MAIN SCREEN
/// ------------------------------------------------------------
class ExtraCharges extends HookConsumerWidget {
  final VoidCallback onConfirmed;

  const ExtraCharges({super.key, required this.onConfirmed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ⚠️ TYPE MUST BE EXPLICIT
    final charges = useState<List<ExtraChargeForm>>([
      ExtraChargeForm(
        reason: TextEditingController(),
        amount: TextEditingController(text: "0"),
      ),
    ]);

    void addNewCharge() {
      charges.value = [
        ...charges.value,
        ExtraChargeForm(
          reason: TextEditingController(),
          amount: TextEditingController(text: "0"),
        ),
      ];
    }

    void removeCharge(int index) {
      if (charges.value.length == 1) return;
      final list = [...charges.value];
      list.removeAt(index);
      charges.value = list;
    }

    return Padding(
      padding: EdgeInsets.all(AppSpacing.w16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Extra Charges", style: AppTextStyles.body(context)),
            SizedBox(height: AppSpacing.h8),
            Text(
              "Add any additional charges if applicable.",
              style: AppTextStyles.body(
                context,
                color: AppColors.secondaryText,
              ),
            ),

            SizedBox(height: AppSpacing.h16),

            /// 🔹 EDITABLE ROWS
            Column(
              children: List.generate(charges.value.length, (index) {
                final charge = charges.value[index];
                return _ExtraChargeRow(
                  form: charge,
                  showDelete: charges.value.length > 1,
                  onDelete: () => removeCharge(index),
                );
              }),
            ),

            SizedBox(height: AppSpacing.h16),

            /// 🔹 ADD EXTRA CHARGE
            GestureDetector(
              onTap: addNewCharge,
              child: DottedBorder(
                options: RectDottedBorderOptions(
                  dashPattern: const [6, 4],
                  strokeWidth: 1,

                  padding: const EdgeInsets.all(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add),
                    SizedBox(width: AppSpacing.w8),
                    Text(
                      "Add Extra Charge",
                      style: AppTextStyles.body(context),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: AppSpacing.h32),

            /// 🔹 CONTINUE
            AppButton(
              content: Text(
                "Continue",
                style: AppTextStyles.body(context, color: AppColors.white),
              ),
              buttonColor: AppColors.orangetheme,
              onTap: () {
                /// 🔥 SAFE & TYPED DATA COLLECTION
                final extraChargesData = charges.value
                    .where(
                      (c) =>
                          c.reason.text.trim().isNotEmpty &&
                          c.amount.text.trim().isNotEmpty,
                    )
                    .map(
                      (c) => {
                        "reason": c.reason.text.trim(),
                        "amount": c.amount.text.trim(),
                      },
                    )
                    .toList();

                debugPrint(extraChargesData.toString());
                onConfirmed();
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// ------------------------------------------------------------
/// 🔹 SINGLE EDITABLE ROW
/// ------------------------------------------------------------
class _ExtraChargeRow extends StatelessWidget {
  final ExtraChargeForm form;
  final VoidCallback onDelete;
  final bool showDelete;

  const _ExtraChargeRow({
    required this.form,
    required this.onDelete,
    required this.showDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.h12),
      child: Column(
        children: [
          AppTextField(controller: form.reason, hint: "Reason"),

          SizedBox(height: AppSpacing.h8),
          AppTextField(
            controller: form.amount,
            hint: "Amount",
            type: const TextInputType.numberWithOptions(),
          ),

          if (showDelete) ...[
            SizedBox(width: AppSpacing.w8),
            GestureDetector(
              onTap: onDelete,
              child: const Icon(Icons.delete, size: 20),
            ),
          ],
        ],
      ),
    );
  }
}
