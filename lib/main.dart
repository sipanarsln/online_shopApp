import 'package:flutter/material.dart';
import 'package:online_shop/feature/home/home_view.dart';
import 'package:online_shop/feature/splash/splash_view.dart';
import 'package:online_shop/product/initialize/application_start.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashView(),
    );
  }
}
