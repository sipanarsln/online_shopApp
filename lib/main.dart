import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_shop/feature/splash/splash_view.dart';
import 'package:online_shop/product/constants/string_constants.dart';
import 'package:online_shop/product/initialize/app_theme.dart';
import 'package:online_shop/product/initialize/application_start.dart';

import 'auth/authentication_view.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      home: const SplashView(),
      theme: AppTheme(context).theme,
    );
  }
}
