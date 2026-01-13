import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

class TermsAndConditions extends HookConsumerWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms & Conditions", style: AppTextStyles.body(context)),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.w16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text("""Last updated: [DD/MM/YYYY]
        
        Welcome to [Your App Name]. By accessing or using this application, you agree to be bound by the following Terms and Conditions. If you do not agree with any part of these terms, you must not use the application.
        
        1. Use of the Application
        
        You agree to use this application only for lawful purposes and in a manner that does not violate any applicable laws, regulations, or third-party rights.
        
        2. User Responsibilities
        
        You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.
        
        3. Content
        
        All content provided within the application is for informational purposes only. We reserve the right to modify or remove content at any time without prior notice.
        
        4. Prohibited Activities
        
        You must not:
        
        Use the application for illegal or unauthorized purposes
        
        Attempt to access restricted areas of the system
        
        Disrupt or interfere with the application’s functionality
        
        5. Limitation of Liability
        
        We shall not be liable for any direct, indirect, incidental, or consequential damages resulting from the use or inability to use this application.
        
        6. Termination
        
        We reserve the right to suspend or terminate your access to the application at any time, without notice, if you violate these terms.
        
        7. Changes to Terms
        
        We may update these Terms and Conditions from time to time. Continued use of the application constitutes acceptance of the revised terms.
        
        8. Contact
        
        If you have any questions about these Terms and Conditions, please contact us at [support@email.com
        ].""", style: AppTextStyles.body(context)),
            ],
          ),
        ),
      ),
    );
  }
}
