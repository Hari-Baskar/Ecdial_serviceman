import 'package:go_router/go_router.dart';
import 'package:jobs_app/features/auth/presentation/login_screen.dart';
import 'package:jobs_app/features/main_pages/dashboard/presentation/bottom_navigation.dart';
import 'package:jobs_app/features/main_pages/home/presentation/home.dart';
import 'package:jobs_app/features/main_pages/home/presentation/job_details.dart';
import 'package:jobs_app/features/main_pages/home/presentation/job_work_flow.dart';
import 'package:jobs_app/features/main_pages/home/presentation/notifications.dart';
import 'package:jobs_app/features/main_pages/more/presentation/attendance.dart';
import 'package:jobs_app/features/main_pages/more/presentation/privacy_policy/ui/privacy_policy.dart';
import 'package:jobs_app/features/main_pages/more/presentation/profile.dart';
import 'package:jobs_app/features/main_pages/more/presentation/settings.dart';
import 'package:jobs_app/features/main_pages/more/presentation/support.dart';
import 'package:jobs_app/features/main_pages/more/terms_and_conditions/ui/terms_and_conditions.dart';
import 'package:jobs_app/features/splash_screens/splash_logo_screen.dart';
import 'package:jobs_app/features/splash_screens/splash_screen_1.dart';

class AppRoutes {
  const AppRoutes._();
  static const String splashLogo = '/logo';
  static const String splashScreen1 = '/splash';
  static const String login = '/login';
  static const String bottomNavigation = '/bottom';
  static const String home = '/home';
  static const String dashBoard = '/dashBoard';
  static const String notifications = '/notifications';
  static const String jobDetails = '/jobDetails';
  static const String jobWorkFlow = '/jobWorkFlow';
  static const String settings = '/settings';
  static const String attendance = '/attendance';
  static const String privacyPolicy = '/privacyPolicy';
  static const String termsAndConditions = '/termsAndConditions';
  static const String support = '/support';
  static const String profile = '/profile';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.dashBoard,
  routes: [
    GoRoute(
      path: AppRoutes.splashLogo,
      builder: (context, state) => const SplashLogoScreen(),
    ),
    GoRoute(
      path: AppRoutes.splashScreen1,
      builder: (context, state) => const SplashScreen1(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.dashBoard,
      builder: (context, state) => const DashBoard(),
    ),
    GoRoute(path: AppRoutes.home, builder: (context, state) => const Home()),
    GoRoute(
      path: AppRoutes.notifications,
      builder: (context, state) => const Notifications(),
    ),
    GoRoute(
      path: AppRoutes.jobDetails,
      builder: (context, state) => const JobDetails(),
    ),
    GoRoute(
      path: AppRoutes.jobWorkFlow,
      builder: (context, state) => const JobWorkflowScreen(),
    ),
    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => const Settings(),
    ),
    GoRoute(
      path: AppRoutes.attendance,
      builder: (context, state) => const Attendance(),
    ),
    GoRoute(
      path: AppRoutes.privacyPolicy,
      builder: (context, state) => const PrivacyPolicy(),
    ),
    GoRoute(
      path: AppRoutes.termsAndConditions,
      builder: (context, state) => const TermsAndConditions(),
    ),
    GoRoute(
      path: AppRoutes.support,
      builder: (context, state) => const Support(),
    ),
    GoRoute(
      path: AppRoutes.profile,
      builder: (context, state) => const Profile(),
    ),
  ],
);
