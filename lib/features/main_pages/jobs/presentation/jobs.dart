import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/Widgets/chip.dart';
import 'package:jobs_app/core/router/app_routes.dart';
import 'package:jobs_app/core/styles/call.dart';
import 'package:jobs_app/core/styles/decoration.dart';
import 'package:jobs_app/core/styles/wrapped_icon.dart';
import 'package:jobs_app/core/styles/wrapped_text.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/radius.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

class Jobs extends HookConsumerWidget {
  const Jobs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChip = useState<String>("All");
    return Scaffold(
      body: Column(
        children: [
          headers(context: context, selectedChip: selectedChip),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(AppSpacing.w16),
              children: [jobsCardWidget(context: context)],
            ),
          ),
        ],
      ),
    );
  }

  Widget headers({
    required BuildContext context,
    required ValueNotifier<String> selectedChip,
  }) {
    return Card(
      elevation: 0.2,
      color: AppColors.white,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.w16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSpacing.h16),
            Text("My Jobs", style: AppTextStyles.body(context)),
            SizedBox(height: AppSpacing.h16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppChip(
                  label: "All",
                  selected: selectedChip.value == "All",
                  onTap: () {
                    selectedChip.value = "All";
                  },
                ),
                AppChip(
                  label: "Today",
                  selected: selectedChip.value == "Today",
                  onTap: () {
                    selectedChip.value = "Today";
                  },
                ),
                AppChip(
                  label: "Upcoming",
                  selected: selectedChip.value == "Upcoming",
                  onTap: () {
                    selectedChip.value = "Upcoming";
                  },
                ),
                AppChip(
                  label: "Done",
                  selected: selectedChip.value == "Done",
                  onTap: () {
                    selectedChip.value = "Done";
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget jobsCardWidget({required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.jobDetails);
      },
      child: Container(
        decoration: getCardDecoration(context: context),
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.w16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  workIcon(context: context),
                  SizedBox(width: AppSpacing.w16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rajesh Kumar', style: AppTextStyles.body(context)),
                      Text(
                        'Ac Repair',
                        style: AppTextStyles.body(
                          context,
                          color: AppColors.orangetheme,
                        ),
                      ),
                    ],
                  ),

                  Spacer(),
                  assigned(context: context),
                ],
              ),
              SizedBox(height: AppSpacing.h12),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: AppSpacing.w8,
                  horizontal: AppSpacing.w12,
                ),
                //margin: EdgeInsets.only(right: AppSpacing.w8),
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppRadius.r16),
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: AppColors.secondaryText),
                    SizedBox(width: AppSpacing.w8),
                    Text(
                      "Chennai, 600028",
                      style: AppTextStyles.body(
                        context,
                        fontSize: 12.sp,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.h12),
              Row(
                children: [
                  Icon(Icons.access_time, color: AppColors.secondaryText),
                  SizedBox(width: AppSpacing.w8),
                  Text(
                    '10:00 AM',
                    style: AppTextStyles.small(
                      context,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  Spacer(),
                  call(context: context),
                ],
              ),
              SizedBox(height: AppSpacing.h12),
              Text(
                "Job Id : 1002",
                style: AppTextStyles.small(context, color: AppColors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// }
// class Jobs extends StatefulWidget {
//   const Jobs({super.key});

//   @override
//   State<Jobs> createState() => _JobsState();
// }

// class _JobsState extends State<Jobs> {
//   String selectedChip = "All";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           headers(),
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.all(AppSpacing.w16),
//               children: [jobsCardWidget()],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget headers() {
//     return Card(
//       elevation: 0.2,
//       color: AppColors.white,
//       child: Padding(
//         padding: EdgeInsets.all(AppSpacing.w16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: AppSpacing.h16),
//             Text("My Jobs", style: AppTextStyles.body(context)),
//             SizedBox(height: AppSpacing.h16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 AppChip(
//                   label: "All",
//                   selected: selectedChip == "All",
//                   onTap: () {
//                     setState(() {
//                       selectedChip = "All";
//                     });
//                   },
//                 ),
//                 AppChip(
//                   label: "Today",
//                   selected: selectedChip == "Today",
//                   onTap: () {
//                     setState(() {
//                       selectedChip = "Today";
//                     });
//                   },
//                 ),
//                 AppChip(
//                   label: "Upcoming",
//                   selected: selectedChip == "Upcoming",
//                   onTap: () {
//                     setState(() {
//                       selectedChip = "Upcoming";
//                     });
//                   },
//                 ),
//                 AppChip(
//                   label: "Done",
//                   selected: selectedChip == "Done",
//                   onTap: () {
//                     setState(() {
//                       selectedChip = "Done";
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget jobsCardWidget() {
//     return Container(
//       decoration: getCardDecoration(context: context),
//       child: Padding(
//         padding: EdgeInsets.all(AppSpacing.w16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 workIcon(context: context),
//                 SizedBox(width: AppSpacing.w16),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Rajesh Kumar', style: AppTextStyles.body(context)),
//                     Text(
//                       'Ac Repair',
//                       style: AppTextStyles.body(
//                         context,
//                         color: AppColors.orangetheme,
//                       ),
//                     ),
//                   ],
//                 ),

//                 Spacer(),
//                 assigned(context: context),
//               ],
//             ),
//             SizedBox(height: AppSpacing.h12),
//             Container(
//               padding: EdgeInsets.symmetric(
//                 vertical: AppSpacing.w8,
//                 horizontal: AppSpacing.w12,
//               ),
//               //margin: EdgeInsets.only(right: AppSpacing.w8),
//               decoration: BoxDecoration(
//                 color: AppColors.grey.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(AppRadius.r16),
//               ),
//               alignment: Alignment.center,
//               child: Row(
//                 children: [
//                   Icon(Icons.location_on, color: AppColors.secondaryText),
//                   SizedBox(width: AppSpacing.w8),
//                   Text(
//                     "Chennai, 600028",
//                     style: AppTextStyles.body(
//                       context,
//                       fontSize: 12.sp,
//                       color: AppColors.secondaryText,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: AppSpacing.h12),
//             Row(
//               children: [
//                 Icon(Icons.access_time, color: AppColors.secondaryText),
//                 SizedBox(width: AppSpacing.w8),
//                 Text(
//                   '10:00 AM',
//                   style: AppTextStyles.small(
//                     context,
//                     color: AppColors.secondaryText,
//                   ),
//                 ),
//                 Spacer(),
//                 call(context: context),
//               ],
//             ),
//             SizedBox(height: AppSpacing.h12),
//             Text(
//               "Job Id : 1002",
//               style: AppTextStyles.small(context, color: AppColors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
