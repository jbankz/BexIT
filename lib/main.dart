import 'dart:async';
import 'dart:io';

import 'package:bexit/Features/Authentication/Views/Signin/SigninView.dart';
import 'package:bexit/Features/Authentication/Views/Password/ChangePasswordView.dart';
import 'package:bexit/Features/Profile/View/ProfileView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked_services/stacked_services.dart';

import 'Core/App/App.router.dart';
import 'Core/Config/AppEnvironment.dart';
import 'Core/CoreExports.dart';
import 'Core/Network/BeingHttpOverrides.dart';
import 'Core/Theme/AppTheme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = BeingHttpOverrides();
  await dotenv.load(fileName: AppEnvironment.fileName);
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => OverlaySupport.global(
      child: ScreenUtilInit(
          designSize: const Size(428, 926),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, __) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Bexit',
              theme: appLightTheme,
              navigatorKey: StackedService.navigatorKey,
              onGenerateRoute: StackedRouter().onGenerateRoute)));
}
