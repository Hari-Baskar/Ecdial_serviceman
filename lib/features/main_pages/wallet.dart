import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/styles/common_strings.dart';
import 'package:jobs_app/core/styles/decoration.dart';
import 'package:jobs_app/core/styles/wrapped_icon.dart';
import 'package:jobs_app/core/styles/wrapped_text.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/button.dart';
import 'package:jobs_app/core/widgets/radius.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

class Wallet extends HookConsumerWidget {
  const Wallet({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          headers(context: context),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(AppSpacing.w16),
              children: [
                SizedBox(height: AppSpacing.h16),
                recentTransactions(context: context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget headers({required BuildContext context}) {
    return Card(
      color: AppColors.white,
      elevation: 0.2,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.w16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSpacing.h16),
            Text("Wallet", style: AppTextStyles.body(context)),
            SizedBox(height: AppSpacing.h16),
            showBalance(context: context),
            SizedBox(height: AppSpacing.h16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                pending(context: context),
                thisMonth(context: context),
                bonus(context: context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget showBalance({required BuildContext context}) {
    return Container(
      decoration: getCardDecoration(
        context: context,
        color: AppColors.bluetheme,
      ),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        children: [
          Row(
            children: [
              moneyIcon(context: context),
              SizedBox(width: AppSpacing.w16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Available Balance",
                      style: AppTextStyles.body(
                        context,
                        color: AppColors.white,
                      ),
                    ),

                    Text(
                      "${rupeesIcon}1,20,000",
                      style: AppTextStyles.body(
                        context,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.h16),
          AppButton(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.file_download_outlined),
                SizedBox(width: AppSpacing.w8),
                Text("Withdraw Money", style: AppTextStyles.body(context)),
              ],
            ),
            onTap: () {},
            buttonColor: AppColors.white,
            textColor: AppColors.black,
          ),
        ],
      ),
    );
  }

  Widget pending({required BuildContext context}) {
    return Container(
      width: AppSize.width * 0.27,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.2,
          color: AppColors.bluetheme.withOpacity(0.8),
        ),
        color: AppColors.bluetheme.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.r16),
      ),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pendingIcon(context: context),
          SizedBox(height: AppSpacing.h8),
          Text(
            "Pending",
            style: AppTextStyles.small(context, color: AppColors.bluetheme),
          ),
          Text("${rupeesIcon}1,200", style: AppTextStyles.body(context)),
        ],
      ),
    );
  }

  Widget thisMonth({required BuildContext context}) {
    return Container(
      width: AppSize.width * 0.27,
      decoration: BoxDecoration(
        border: Border.all(width: 0.2, color: AppColors.green.withOpacity(0.8)),
        color: AppColors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.r16),
      ),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          thisMonthIcon(context: context),
          SizedBox(height: AppSpacing.h8),
          Text(
            "This Month",
            style: AppTextStyles.small(context, color: AppColors.green),
          ),
          Text("${rupeesIcon}1,200", style: AppTextStyles.body(context)),
        ],
      ),
    );
  }

  Widget bonus({required BuildContext context}) {
    return Container(
      width: AppSize.width * 0.27,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.2,
          color: AppColors.orangetheme.withOpacity(0.8),
        ),
        color: AppColors.orangetheme.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.r16),
      ),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bonusIcon(context: context),
          SizedBox(height: AppSpacing.h8),
          Text(
            "Bonus",
            style: AppTextStyles.small(context, color: AppColors.orangetheme),
          ),
          Text("${rupeesIcon}1,200", style: AppTextStyles.body(context)),
        ],
      ),
    );
  }

  Widget recentTransactions({required BuildContext context}) {
    return Column(
      children: [
        Row(
          children: [
            Text('Recent Transactions', style: AppTextStyles.body(context)),
            Spacer(),
            viewAll(context: context),
          ],
        ),
        SizedBox(height: AppSpacing.h16),
        recentTransactionsSubWidget(context: context),
      ],
    );
  }

  Widget recentTransactionsSubWidget({required BuildContext context}) {
    return Container(
      decoration: getCardDecoration(context: context),
      padding: EdgeInsets.all(AppSpacing.w16),
      child: Row(
        children: [
          withdrawIcon(context: context),
          // payoutReceivedIcon(context: context),
          SizedBox(width: AppSpacing.w16),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Praveen", style: AppTextStyles.body(context)),

                    Text(
                      "+${rupeesIcon}1,200",
                      style: AppTextStyles.body(
                        context,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today, 2:20 PM",
                      style: AppTextStyles.small(
                        context,
                        color: AppColors.secondaryText,
                      ),
                    ),
                    processing(context: context),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           headers(),
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.all(AppSpacing.w16),
//               children: [
//                 SizedBox(height: AppSpacing.h16),
//                 recentTransactions(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget headers() {
//     return Card(
//       color: AppColors.white,
//       elevation: 0.2,
//       child: Padding(
//         padding: EdgeInsets.all(AppSpacing.w16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: AppSpacing.h16),
//             Text("Wallet", style: AppTextStyles.body(context)),
//             SizedBox(height: AppSpacing.h16),
//             showBalance(),
//             SizedBox(height: AppSpacing.h16),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [pending(), thisMonth(), bonus()],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget showBalance() {
//     return Container(
//       decoration: getCardDecoration(
//         context: context,
//         color: AppColors.bluetheme,
//       ),
//       padding: EdgeInsets.all(AppSpacing.w16),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               moneyIcon(context: context),
//               SizedBox(width: AppSpacing.w16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Available Balance",
//                       style: AppTextStyles.body(
//                         context,
//                         color: AppColors.white,
//                       ),
//                     ),

//                     Text(
//                       "${rupeesIcon}1,20,000",
//                       style: AppTextStyles.body(
//                         context,
//                         color: AppColors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: AppSpacing.h16),
//           AppButton(
//             text: "Withdraw Money",
//             onTap: () {},
//             buttonColor: AppColors.white,
//             textColor: AppColors.black,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget pending() {
//     return Container(
//       width: AppSize.width * 0.27,
//       decoration: BoxDecoration(
//         border: Border.all(
//           width: 0.2,
//           color: AppColors.bluetheme.withOpacity(0.8),
//         ),
//         color: AppColors.bluetheme.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(AppRadius.r16),
//       ),
//       padding: EdgeInsets.all(AppSpacing.w16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           pendingIcon(context: context),
//           SizedBox(height: AppSpacing.h8),
//           Text(
//             "Pending",
//             style: AppTextStyles.small(context, color: AppColors.bluetheme),
//           ),
//           Text("${rupeesIcon}1,200", style: AppTextStyles.body(context)),
//         ],
//       ),
//     );
//   }

//   Widget thisMonth() {
//     return Container(
//       width: AppSize.width * 0.27,
//       decoration: BoxDecoration(
//         border: Border.all(width: 0.2, color: AppColors.green.withOpacity(0.8)),
//         color: AppColors.green.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(AppRadius.r16),
//       ),
//       padding: EdgeInsets.all(AppSpacing.w16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           thisMonthIcon(context: context),
//           SizedBox(height: AppSpacing.h8),
//           Text(
//             "This Month",
//             style: AppTextStyles.small(context, color: AppColors.green),
//           ),
//           Text("${rupeesIcon}1,200", style: AppTextStyles.body(context)),
//         ],
//       ),
//     );
//   }

//   Widget bonus() {
//     return Container(
//       width: AppSize.width * 0.27,
//       decoration: BoxDecoration(
//         border: Border.all(
//           width: 0.2,
//           color: AppColors.orangetheme.withOpacity(0.8),
//         ),
//         color: AppColors.orangetheme.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(AppRadius.r16),
//       ),
//       padding: EdgeInsets.all(AppSpacing.w16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           bonusIcon(context: context),
//           SizedBox(height: AppSpacing.h8),
//           Text(
//             "Bonus",
//             style: AppTextStyles.small(context, color: AppColors.orangetheme),
//           ),
//           Text("${rupeesIcon}1,200", style: AppTextStyles.body(context)),
//         ],
//       ),
//     );
//   }

//   Widget recentTransactions() {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Text('Recent Transactions', style: AppTextStyles.body(context)),
//             Spacer(),
//             viewAll(context: context),
//           ],
//         ),
//         SizedBox(height: AppSpacing.h16),
//         recentTransactionsSubWidget(),
//       ],
//     );
//   }

//   Widget recentTransactionsSubWidget() {
//     return Container(
//       decoration: getCardDecoration(context: context),
//       padding: EdgeInsets.all(AppSpacing.w16),
//       child: Row(
//         children: [
//           withdrawIcon(context: context),
//           // payoutReceivedIcon(context: context),
//           SizedBox(width: AppSpacing.w16),
//           Expanded(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Praveen", style: AppTextStyles.body(context)),

//                     Text(
//                       "+${rupeesIcon}1,200",
//                       style: AppTextStyles.body(
//                         context,
//                         color: AppColors.green,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Today, 2:20 PM",
//                       style: AppTextStyles.small(
//                         context,
//                         color: AppColors.secondaryText,
//                       ),
//                     ),
//                     processing(context: context),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
