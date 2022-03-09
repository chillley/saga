import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:saga/db/store.dart';
import 'package:saga/constant/constant.dart';
import 'package:saga/routes/route_config.dart';
import 'package:saga/services/index.dart';

import 'splash_state.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final SplashState state = SplashState();

  late AnimationController animationController =
      AnimationController(duration: const Duration(seconds: 2), vsync: this);

  late Animation<double> animation =
      Tween(begin: 0.0, end: 1.0).animate(animationController);

  @override
  void onReady() {
    super.onReady();
    animationController.forward();
    final login = Store.getLogin();
    state.account = login['Account'] ?? "";
    state.password = login['Password'] ?? "";
    if (state.account.isNotEmpty && state.password.isNotEmpty) {
      autoLogin();
    } else {
      WidgetsBinding.instance!.addPostFrameCallback((_) async {
        await Future.delayed(const Duration(seconds: 2), () {
          Get.offNamed(RouteConfig.login);
        });
      });
    }
  }

  Future autoLogin() async {
    "登录中".loading();
    final res = await Http.login(
        {"username": state.account, "password": state.password});
    SmartDialog.dismiss(status: SmartStatus.loading);
    if (res['msg'] == Constant.requestSuccess) {
      "登录成功".toast();
      Get.offNamed(RouteConfig.index);
    } else {
      "自动登录失败".toast();
    }
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }
}
