import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_shop/feature/home/sub_view/bottom_home_page.dart';
import 'package:online_shop/feature/splash/splash_proiver.dart';
import 'package:online_shop/product/constants/color_constants.dart';
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
    await Future.delayed(const Duration(seconds: 1));

    // ignore: use_build_context_synchronously
    await Navigator.pushReplacement(
      context,
      // ignore: inference_failure_on_instance_creation
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.grayLighter,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 200),
            child: IconConstants.appIcon.toImage,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: <Widget>[
                const Text(
                  'Online ',
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 60,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText(
                        'Shop',
                        transitionHeight: 75,
                        textStyle: TextStyle(
                          color: ColorConstants.primaryColor,
                          fontSize: 60,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )

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
    );
  }
}
