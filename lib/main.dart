import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_app/core/router/app_routes.dart';
import 'package:jobs_app/features/splash_screens/splash_logo_screen.dart';
import 'package:jobs_app/features/splash_screens/splash_screen_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return ProviderScope(
          child: MaterialApp.router(
            routerConfig: appRouter,
            theme: ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor: Color(
                0xFFF9F9F9,
              ), //Colors.white.withOpacity(0.8),
              canvasColor: Colors.white,
              colorScheme: const ColorScheme.light(
                surface: Colors.white,
                primary: Colors.white,
              ),
            ),

            // 🔹 DISABLE DARK MODE COMPLETELY
            darkTheme: ThemeData.light(),
            themeMode: ThemeMode.light,
          ),
        );
      },
    );
  }
}
