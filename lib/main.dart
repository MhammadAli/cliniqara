import 'package:cliniqara/core/di/di.dart';
import 'package:cliniqara/core/routing/router.dart';
import 'package:cliniqara/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection before the widget tree is built.
  await initDependencies();

  runApp(const CliniqaraApp());
}

class CliniqaraApp extends StatelessWidget {
  const CliniqaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtil is initialized here with a design canvas of 390×844 (iPhone 14).
    // All sp/dp values in widgets scale relative to this baseline.
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          title: 'Cliniqara',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: appRouter,
        );
      },
    );
  }
}
