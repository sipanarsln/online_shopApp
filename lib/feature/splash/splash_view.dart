import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          IconConstants.appIcon.toImage,
          AnimatedTextKit(animatedTexts: [
            WavyAnimatedText(
              StringConstants.appName,
              textStyle: context.textTheme.headlineSmall?.copyWith(
                  color: ColorConstants.white, fontWeight: FontWeight.bold),
            ),
          ]),
        ],
      )),
    );
  }
}
