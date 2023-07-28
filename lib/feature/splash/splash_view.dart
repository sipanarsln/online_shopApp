import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:online_shop/feature/home/home_view.dart';
import 'package:online_shop/feature/splash/splash_proiver.dart';
import 'package:online_shop/product/constants/color_constants.dart';
import 'package:online_shop/product/constants/string_constants.dart';
import 'package:online_shop/product/enums/icon_constants.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  final splashProvider =
      StateNotifierProvider<SplashProvider, SplashState>((ref) {
    return SplashProvider();
  });

  Future<void> loadData() async {
    await FirebaseFirestore.instance.collection('products').get();
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 10));

    // ignore: use_build_context_synchronously
    await Navigator.pushReplacement(
      context,
      // ignore: inference_failure_on_instance_creation
      MaterialPageRoute(
        builder: (context) => const HomeView(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  final colorizeColors = [
    ColorConstants.primaryColor,
    const Color(0xffEB412A),
    Colors.yellow,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff13C0EB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconConstants.appIcon.toImage,
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  StringConstants.appName,
                  colors: colorizeColors,
                  textStyle: context.textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 55,
                    shadows: [
                      Shadow(
                        color: ColorConstants.black,
                        offset: const Offset(5, 3),
                      )
                    ],
                  ),
                )
              ],
            ),

            // AnimatedTextKit(
            //   animatedTexts: [
            //     WavyAnimatedText(
            //       StringConstants.appName,
            //       textStyle: context.textTheme.headlineMedium?.copyWith(
            //         fontWeight: FontWeight.bold,
            //         letterSpacing: 10,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
