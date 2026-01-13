import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jobs_app/core/styles/decoration.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/radius.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';

class More extends HookConsumerWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          headers(context: context),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(AppSpacing.w16),
              children: [allProfileWidgets(context: context)],
            ),
          ),
        ],
      ),
    );
  }

  Widget headers({required BuildContext context}) {
    return Card(
      color: AppColors.white,
      margin: EdgeInsets.zero,
      elevation: 0.2,
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.w16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSpacing.h16),
            Text("More", style: AppTextStyles.body(context)),
            SizedBox(height: AppSpacing.h16),
            showProfile(context: context),
            SizedBox(height: AppSpacing.h16),
          ],
        ),
      ),
    );
  }

  Widget showProfile({required BuildContext context}) {
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
              profilePicWidget(),
              SizedBox(width: AppSpacing.w16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile Name",
                      style: AppTextStyles.body(
                        context,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: AppSpacing.h2),

                    Text(
                      "Place",
                      style: AppTextStyles.body(
                        context,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                Icons.arrow_forward_ios_sharp,
                size: AppSize.width * 0.04,
                color: AppColors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget profilePicWidget() {
    return Container(
      height: AppSize.width * 0.13,
      width: AppSize.width * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r12),
        color: AppColors.white,
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.r12),
          child: Image.asset(
            "assets/splash/profile.jpg",
            fit: BoxFit.cover,
            height: AppSize.width * 0.12,
            width: AppSize.width * 0.12,
          ),
        ),
      ),
    );
  }

  Widget allProfileWidgets({required BuildContext context}) {
    return Column(
      children: [
        profileSubWidget(
          icon: Icons.person_3_outlined,
          iconColor: AppColors.lightBlue,
          title: 'Profile',
          onTap: () {},
          context: context,
        ),
        SizedBox(height: AppSpacing.h8),
        profileSubWidget(
          icon: Icons.calendar_today_outlined,
          iconColor: AppColors.green,
          title: 'Attendance',
          onTap: () {},
          context: context,
        ),
        SizedBox(height: AppSpacing.h8),
        profileSubWidget(
          icon: Icons.trending_up,
          iconColor: AppColors.bluetheme,
          title: 'Earnings Report',
          onTap: () {},
          context: context,
        ),
        SizedBox(height: AppSpacing.h8),
        profileSubWidget(
          icon: Icons.star_outline_rounded,
          iconColor: AppColors.darkOrange,
          title: 'Ratings & Reviews',
          onTap: () {},
          context: context,
        ),
        SizedBox(height: AppSpacing.h8),
        profileSubWidget(
          icon: Icons.notifications_none,
          iconColor: AppColors.pink,
          title: 'Notifications',
          onTap: () {},
          context: context,
        ),
        SizedBox(height: AppSpacing.h8),
        profileSubWidget(
          icon: Icons.description_outlined,
          iconColor: AppColors.purple,
          title: 'Documents',
          onTap: () {},
          context: context,
        ),
        SizedBox(height: AppSpacing.h8),
        profileSubWidget(
          icon: Icons.headset_mic_outlined,
          iconColor: AppColors.pink,
          title: 'Support',
          onTap: () {},
          context: context,
        ),
        SizedBox(height: AppSpacing.h8),
        profileSubWidget(
          icon: Icons.settings_outlined,
          iconColor: AppColors.grey,
          title: 'Settings',
          onTap: () {},
          context: context,
        ),
        SizedBox(height: AppSpacing.h8),
        profileSubWidget(
          icon: Icons.logout_outlined,
          iconColor: AppColors.red,
          title: 'Logout',
          onTap: () {},
          context: context,
        ),
      ],
    );
  }

  Widget profileSubWidget({
    required IconData icon,
    required Color iconColor,
    required String title,
    required Function onTap,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: getCardDecoration(context: context),
        padding: EdgeInsets.all(AppSpacing.w16),
        child: Row(
          children: [
            subIcon(icon: icon, iconColor: iconColor),
            // payoutReceivedIcon(context: context),
            SizedBox(width: AppSpacing.w16),

            Text(title, style: AppTextStyles.body(context)),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: AppSize.width * 0.035,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }

  subIcon({required IconData icon, required Color iconColor}) {
    return Container(
      height: AppSize.width * 0.12,
      width: AppSize.width * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r12),
        color: iconColor.withOpacity(0.1),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.r12),
          child: Icon(icon, color: iconColor, size: AppSize.width * 0.07),
        ),
      ),
    );
  }
}

// class More extends StatefulWidget {
//   const More({super.key});

//   @override
//   State<More> createState() => _MoreState();
// }

// class _MoreState extends State<More> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           headers(),
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.all(AppSpacing.w16),
//               children: [allProfileWidgets()],
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
//             Text("More", style: AppTextStyles.body(context)),
//             SizedBox(height: AppSpacing.h16),
//             showProfile(),
//             SizedBox(height: AppSpacing.h16),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget showProfile() {
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
//               profilePicWidget(),
//               SizedBox(width: AppSpacing.w16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Profile Name",
//                       style: AppTextStyles.body(
//                         context,
//                         color: AppColors.white,
//                       ),
//                     ),
//                     SizedBox(height: AppSpacing.h2),

//                     Text(
//                       "Place",
//                       style: AppTextStyles.body(
//                         context,
//                         color: AppColors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               Icon(
//                 Icons.arrow_forward_ios_sharp,
//                 size: AppSize.width * 0.04,
//                 color: AppColors.grey,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget profilePicWidget() {
//     return Container(
//       height: AppSize.width * 0.13,
//       width: AppSize.width * 0.13,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(AppRadius.r12),
//         color: AppColors.white,
//       ),
//       child: Center(
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(AppRadius.r12),
//           child: Image.asset(
//             "assets/splash/profile.jpg",
//             fit: BoxFit.cover,
//             height: AppSize.width * 0.12,
//             width: AppSize.width * 0.12,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget allProfileWidgets() {
//     return Column(
//       children: [
//         profileSubWidget(
//           icon: Icons.person_3_outlined,
//           iconColor: AppColors.lightBlue,
//           title: 'Profile',
//           onTap: () {},
//         ),
//         SizedBox(height: AppSpacing.h8),
//         profileSubWidget(
//           icon: Icons.calendar_today_outlined,
//           iconColor: AppColors.green,
//           title: 'Attendance',
//           onTap: () {},
//         ),
//         SizedBox(height: AppSpacing.h8),
//         profileSubWidget(
//           icon: Icons.trending_up,
//           iconColor: AppColors.bluetheme,
//           title: 'Earnings Report',
//           onTap: () {},
//         ),
//         SizedBox(height: AppSpacing.h8),
//         profileSubWidget(
//           icon: Icons.star_outline_rounded,
//           iconColor: AppColors.darkOrange,
//           title: 'Ratings & Reviews',
//           onTap: () {},
//         ),
//         SizedBox(height: AppSpacing.h8),
//         profileSubWidget(
//           icon: Icons.notifications_none,
//           iconColor: AppColors.pink,
//           title: 'Notifications',
//           onTap: () {},
//         ),
//         SizedBox(height: AppSpacing.h8),
//         profileSubWidget(
//           icon: Icons.description_outlined,
//           iconColor: AppColors.purple,
//           title: 'Documents',
//           onTap: () {},
//         ),
//         SizedBox(height: AppSpacing.h8),
//         profileSubWidget(
//           icon: Icons.headset_mic_outlined,
//           iconColor: AppColors.pink,
//           title: 'Support',
//           onTap: () {},
//         ),
//         SizedBox(height: AppSpacing.h8),
//         profileSubWidget(
//           icon: Icons.settings_outlined,
//           iconColor: AppColors.grey,
//           title: 'Settings',
//           onTap: () {},
//         ),
//         SizedBox(height: AppSpacing.h8),
//         profileSubWidget(
//           icon: Icons.logout_outlined,
//           iconColor: AppColors.red,
//           title: 'Logout',
//           onTap: () {},
//         ),
//       ],
//     );
//   }

//   Widget profileSubWidget({
//     required IconData icon,
//     required Color iconColor,
//     required String title,
//     required Function onTap,
//   }) {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         decoration: getCardDecoration(context: context),
//         padding: EdgeInsets.all(AppSpacing.w16),
//         child: Row(
//           children: [
//             subIcon(icon: icon, iconColor: iconColor),
//             // payoutReceivedIcon(context: context),
//             SizedBox(width: AppSpacing.w16),

//             Text(title, style: AppTextStyles.body(context)),
//             Spacer(),
//             Icon(
//               Icons.arrow_forward_ios_sharp,
//               size: AppSize.width * 0.035,
//               color: AppColors.grey,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   subIcon({required IconData icon, required Color iconColor}) {
//     return Container(
//       height: AppSize.width * 0.12,
//       width: AppSize.width * 0.12,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(AppRadius.r12),
//         color: iconColor.withOpacity(0.1),
//       ),
//       child: Center(
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(AppRadius.r12),
//           child: Icon(icon, color: iconColor, size: AppSize.width * 0.07),
//         ),
//       ),
//     );
//   }
// }
