import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/button.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';
import 'package:jobs_app/core/widgets/text_field.dart';

class PartForm {
  final TextEditingController name;
  final TextEditingController qty;
  final TextEditingController price;
  final TextEditingController tax;

  PartForm({
    required this.name,
    required this.qty,
    required this.price,
    required this.tax,
  });
}

class PartsUsed extends HookConsumerWidget {
  final VoidCallback onConfirmed;

  const PartsUsed({super.key, required this.onConfirmed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final partForms = useState<List<PartForm>>([
      PartForm(
        name: TextEditingController(),
        qty: TextEditingController(),
        price: TextEditingController(),
        tax: TextEditingController(),
      ),
    ]);

    void addNewRow() {
      partForms.value = [
        ...partForms.value,
        PartForm(
          name: TextEditingController(),
          qty: TextEditingController(),
          price: TextEditingController(),
          tax: TextEditingController(),
        ),
      ];
    }

    void removeRow(int index) {
      final list = [...partForms.value];
      list.removeAt(index);
      partForms.value = list;
    }

    return Padding(
      padding: EdgeInsets.all(AppSpacing.w16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Parts Used", style: AppTextStyles.body(context)),
            SizedBox(height: AppSpacing.h8),
            Text(
              "Add any parts used during the service.",
              style: AppTextStyles.body(
                context,
                color: AppColors.secondaryText,
              ),
            ),

            SizedBox(height: AppSpacing.h16),

            /// 🔹 EDITABLE FORM ROWS
            Column(
              children: List.generate(partForms.value.length, (index) {
                final form = partForms.value[index];
                return _EditablePartRow(
                  form: form,
                  context: context,
                  showDelete: partForms.value.length > 1,
                  onDelete: () => removeRow(index),
                );
              }),
            ),

            SizedBox(height: AppSpacing.h16),

            /// 🔹 ADD PART
            GestureDetector(
              onTap: addNewRow,
              child: DottedBorder(
                options: RectDottedBorderOptions(
                  dashPattern: const [6, 4],
                  strokeWidth: 1,
                  // borderRadius: BorderRadius.circular(12),
                  padding: const EdgeInsets.all(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add),
                    SizedBox(width: AppSpacing.w8),
                    Text("Add Part", style: AppTextStyles.body(context)),
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
              onTap: () {
                // 🔥 FINAL DATA COLLECTION
                final partsData = partForms.value.map((f) {
                  return {
                    "name": f.name.text.trim(),
                    "qty": f.qty.text.trim(),
                    "price": f.price.text.trim(),
                    "tax": f.tax.text.trim(),
                  };
                }).toList();

                debugPrint(partsData.toString());
                onConfirmed();
              },
              buttonColor: AppColors.orangetheme,
            ),
          ],
        ),
      ),
    );
  }
}

/// ------------------------------------------------------------
/// SINGLE EDITABLE ROW
/// ------------------------------------------------------------
class _EditablePartRow extends StatelessWidget {
  final PartForm form;
  final BuildContext context;
  final VoidCallback onDelete;
  final bool showDelete;

  const _EditablePartRow({
    required this.form,
    required this.context,
    required this.onDelete,
    required this.showDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.h12),
      child: Column(
        children: [
          AppTextField(controller: form.name, hint: "Part name"),
          SizedBox(height: AppSpacing.h8),
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  controller: form.qty,
                  hint: "Qty",
                  type: const TextInputType.numberWithOptions(),
                ),
              ),
              SizedBox(width: AppSpacing.w8),
              Expanded(
                child: AppTextField(
                  controller: form.price,
                  hint: "Price",
                  type: const TextInputType.numberWithOptions(),
                ),
              ),
              SizedBox(width: AppSpacing.w8),
              Expanded(
                child: AppTextField(
                  controller: form.tax,
                  hint: "Tax %",
                  type: const TextInputType.numberWithOptions(),
                ),
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
        ],
      ),
    );
  }
}
