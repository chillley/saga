import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_image/extended_image.dart';
import 'package:saga/constant/constant.dart';
import 'package:saga/routes/route_config.dart';

import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    final state = Get.find<SplashController>().state;

    return AnnotatedRegion(
      value: lightSystemUiOverlayStyle,
      child: Scaffold(
        body: Center(
          child: FadeTransition(
            opacity: controller.animation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExtendedImage.asset(
                  "assets/images/splash.png",
                  width: 200,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
