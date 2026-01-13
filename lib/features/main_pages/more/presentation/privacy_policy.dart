import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

class PrivacyPolicy extends HookConsumerWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy", style: AppTextStyles.body(context)),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.w16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text("""Last updated: [DD/MM/YYYY]
        
        Your privacy is important to us. This Privacy Policy explains how [Your App Name] collects, uses, and protects your information.
        
        1. Information We Collect
        
        We may collect personal information such as your name, email address, phone number, and usage data when you use the application.
        
        2. How We Use Information
        
        The information we collect may be used to:
        
        Provide and improve our services
        
        Communicate with you
        
        Ensure security and prevent fraud
        
        3. Data Storage and Security
        
        We implement reasonable security measures to protect your personal information from unauthorized access, alteration, or disclosure.
        
        4. Sharing of Information
        
        We do not sell or rent your personal information to third parties. Information may be shared only when required by law or to provide essential services.
        
        5. Cookies and Tracking
        
        The application may use cookies or similar technologies to enhance user experience and analyze usage patterns.
        
        6. User Rights
        
        You have the right to access, update, or delete your personal information, subject to applicable laws.
        
        7. Changes to This Policy
        
        We may update this Privacy Policy from time to time. Any changes will be posted within the application.
        
        8. Contact Us
        
        If you have questions or concerns about this Privacy Policy, contact us at [support@email.com
        ].""", style: AppTextStyles.body(context)),
            ],
          ),
        ),
      ),
    );
  }
}
