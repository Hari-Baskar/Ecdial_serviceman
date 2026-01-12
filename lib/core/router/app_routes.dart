import 'package:go_router/go_router.dart';
import 'package:jobs_app/features/auth/presentation/login_screen.dart';
import 'package:jobs_app/features/main_pages/dashboard/presentation/bottom_navigation.dart';
import 'package:jobs_app/features/main_pages/home/presentation/home.dart';
import 'package:jobs_app/features/main_pages/home/presentation/job_details.dart';
import 'package:jobs_app/features/main_pages/home/presentation/notifications.dart';
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
  ],
);
