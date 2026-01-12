import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/Widgets/radius.dart';
import 'package:jobs_app/core/Widgets/spacing_size.dart';
import 'package:jobs_app/core/Widgets/text.dart';
import 'package:jobs_app/core/router/app_routes.dart';
import 'package:jobs_app/core/styles/wrapped_icon.dart';
import 'package:jobs_app/core/styles/wrapped_text.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/styles/decoration.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          headers(context: context), // FIXED
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(AppSpacing.w16),
              children: [
                recentJobs(context: context),
                SizedBox(height: AppSpacing.h32),
                topPerformers(context: context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget headers({required BuildContext context}) {
    return Card(
      elevation: 0.2,
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.w16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSpacing.h16),

            Row(
              children: [
                Container(
                  height: AppSize.height * 0.07,
                  width: AppSize.height * 0.07,
                  decoration: BoxDecoration(
                    color: AppColors.bluetheme,
                    borderRadius: BorderRadius.circular(AppRadius.r12),
                  ),

                  child: Center(
                    child: Text(
                      "T",
                      style: AppTextStyles.heading(
                        context,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppSpacing.w16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back",
                      style: AppTextStyles.body(
                        context,
                        color: AppColors.secondaryText,
                      ),
                    ),
                    Text("Technician", style: AppTextStyles.body(context)),
                  ],
                ),

                Spacer(),
                IconButton(
                  onPressed: () {
                    context.push(AppRoutes.notifications);
                  },
                  icon: Icon(Icons.notifications_none_sharp),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.h12),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.access_time, color: AppColors.secondaryText),
                SizedBox(width: AppSpacing.w8),
                Text(
                  "Friday, January 9",
                  style: AppTextStyles.small(
                    context,
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget recentJobs({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Recent Jobs', style: AppTextStyles.body(context)),
            Spacer(),
            viewAll(context: context),
          ],
        ),
        SizedBox(height: AppSpacing.h16),
        recentJobBoxWidget(context: context, index: 1),
        SizedBox(height: AppSpacing.h8),
        recentJobBoxWidget(context: context, index: 2),
        SizedBox(height: AppSpacing.h8),
        recentJobBoxWidget(context: context, index: 3),
      ],
    );
  }

  Widget recentJobBoxWidget({required BuildContext context, int index = 1}) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.jobDetails);
      },
      child: Container(
        decoration: getCardDecoration(context: context),
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.w16),
          child: Column(
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
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),

                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: AppSize.width * 0.04,
                    color: AppColors.grey,
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.h16),
              Row(
                children: [
                  index == 1
                      ? inProgress(context: context)
                      : index == 2
                      ? completed(context: context)
                      : assigned(context: context),
                  Spacer(),
                  Text(
                    '10:00 AM',
                    style: AppTextStyles.body(
                      context,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget topPerformers({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.r16),
                color: AppColors.yellow.withOpacity(0.15),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.w8),
                child: Icon(
                  Icons.workspace_premium_outlined,
                  color: AppColors.darkOrange,
                ),
              ),
            ),
            SizedBox(width: AppSpacing.w8),
            Text('Top Performers', style: AppTextStyles.body(context)),
          ],
        ),

        SizedBox(height: AppSpacing.h16),
        Container(
          decoration: getCardDecoration(context: context),
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.w16),
            child: Column(
              children: [
                topPerformersSubWidget(context: context, index: 1),
                Divider(
                  height: AppSpacing.h24,
                  color: AppColors.grey.withOpacity(0.2),
                ),
                topPerformersSubWidget(context: context, index: 2),
                Divider(
                  height: AppSpacing.h24,

                  color: AppColors.grey.withOpacity(0.2),
                ),
                topPerformersSubWidget(context: context, index: 3),
              ],
            ),
          ),
        ),
      ],
    );
  }

  topPerformersSubWidget({required BuildContext context, int index = 1}) {
    return Row(
      children: [
        Container(
          height: AppSize.height * 0.07,
          width: AppSize.height * 0.07,
          decoration: BoxDecoration(
            color: AppColors.bluetheme,
            borderRadius: BorderRadius.circular(AppRadius.r12),
          ),

          child: Center(
            child: Text(
              "T",
              style: AppTextStyles.heading(context, color: AppColors.white),
            ),
          ),
        ),
        SizedBox(width: AppSpacing.w16),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome back", style: AppTextStyles.body(context)),

                  Text(
                    "45.2k",
                    style: AppTextStyles.body(context, color: AppColors.green),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rank #${index}",
                    style: AppTextStyles.small(
                      context,
                      color: AppColors.secondaryText,
                    ),
                  ),

                  Text(
                    "earned",
                    style: AppTextStyles.small(
                      context,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           headers(), // FIXED
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.all(AppSpacing.w16),
//               children: [
//                 recentJobs(),
//                 SizedBox(height: AppSpacing.h32),
//                 topPerformers(),
//               ],
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

//             Row(
//               children: [
//                 Container(
//                   height: AppSize.height * 0.07,
//                   width: AppSize.height * 0.07,
//                   decoration: BoxDecoration(
//                     color: AppColors.bluetheme,
//                     borderRadius: BorderRadius.circular(AppRadius.r12),
//                   ),

//                   child: Center(
//                     child: Text(
//                       "T",
//                       style: AppTextStyles.heading(
//                         context,
//                         color: AppColors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: AppSpacing.w16),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Welcome back",
//                       style: AppTextStyles.body(
//                         context,
//                         color: AppColors.secondaryText,
//                       ),
//                     ),
//                     Text("Technician", style: AppTextStyles.body(context)),
//                   ],
//                 ),

//                 Spacer(),
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.notifications_none_sharp),
//                 ),
//               ],
//             ),
//             SizedBox(height: AppSpacing.h12),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Icon(Icons.access_time, color: AppColors.secondaryText),
//                 SizedBox(width: AppSpacing.w8),
//                 Text(
//                   "Friday, January 9",
//                   style: AppTextStyles.small(
//                     context,
//                     color: AppColors.secondaryText,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget recentJobs() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Text('Recent Jobs', style: AppTextStyles.body(context)),
//             Spacer(),
//             viewAll(context: context),
//           ],
//         ),
//         SizedBox(height: AppSpacing.h16),
//         recentJobBoxWidget(1),
//         SizedBox(height: AppSpacing.h8),
//         recentJobBoxWidget(2),
//         SizedBox(height: AppSpacing.h8),
//         recentJobBoxWidget(3),
//       ],
//     );
//   }

//   Widget recentJobBoxWidget(int index) {
//     return Container(
//       decoration: getCardDecoration(context: context),
//       child: Padding(
//         padding: EdgeInsets.all(AppSpacing.w16),
//         child: Column(
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
//                         color: AppColors.secondaryText,
//                       ),
//                     ),
//                   ],
//                 ),

//                 Spacer(),
//                 Icon(
//                   Icons.arrow_forward_ios_sharp,
//                   size: AppSize.width * 0.04,
//                   color: AppColors.grey,
//                 ),
//               ],
//             ),
//             SizedBox(height: AppSpacing.h16),
//             Row(
//               children: [
//                 index == 1
//                     ? inProgress(context: context)
//                     : index == 2
//                     ? completed(context: context)
//                     : assigned(context: context),
//                 Spacer(),
//                 Text(
//                   '10:00 AM',
//                   style: AppTextStyles.body(
//                     context,
//                     color: AppColors.secondaryText,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget topPerformers() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(AppRadius.r16),
//                 color: AppColors.yellow.withOpacity(0.15),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(AppSpacing.w8),
//                 child: Icon(
//                   Icons.workspace_premium_outlined,
//                   color: AppColors.darkOrange,
//                 ),
//               ),
//             ),
//             SizedBox(width: AppSpacing.w8),
//             Text('Top Performers', style: AppTextStyles.body(context)),
//           ],
//         ),

//         SizedBox(height: AppSpacing.h16),
//         Container(
//           decoration: getCardDecoration(context: context),
//           child: Padding(
//             padding: EdgeInsets.all(AppSpacing.w16),
//             child: Column(
//               children: [
//                 topPerformersSubWidget(1),
//                 Divider(
//                   height: AppSpacing.h24,
//                   color: AppColors.grey.withOpacity(0.2),
//                 ),
//                 topPerformersSubWidget(2),
//                 Divider(
//                   height: AppSpacing.h24,

//                   color: AppColors.grey.withOpacity(0.2),
//                 ),
//                 topPerformersSubWidget(3),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   topPerformersSubWidget(int index) {
//     return Row(
//       children: [
//         Container(
//           height: AppSize.height * 0.07,
//           width: AppSize.height * 0.07,
//           decoration: BoxDecoration(
//             color: AppColors.bluetheme,
//             borderRadius: BorderRadius.circular(AppRadius.r12),
//           ),

//           child: Center(
//             child: Text(
//               "T",
//               style: AppTextStyles.heading(context, color: AppColors.white),
//             ),
//           ),
//         ),
//         SizedBox(width: AppSpacing.w16),
//         Expanded(
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Welcome back", style: AppTextStyles.body(context)),

//                   Text(
//                     "45.2k",
//                     style: AppTextStyles.body(context, color: AppColors.green),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Rank #${index}",
//                     style: AppTextStyles.small(
//                       context,
//                       color: AppColors.secondaryText,
//                     ),
//                   ),

//                   Text(
//                     "earned",
//                     style: AppTextStyles.small(
//                       context,
//                       color: AppColors.secondaryText,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
