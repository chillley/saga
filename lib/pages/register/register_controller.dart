import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:saga/constant/constant.dart';
import 'package:saga/db/store.dart';
import 'package:saga/pages/login/login_controller.dart';
import 'package:saga/routes/route_config.dart';
import 'package:saga/services/api.dart';
import 'package:saga/services/http_util.dart';
import 'package:saga/services/index.dart';
import 'register_state.dart';

class RegisterController extends GetxController {
  final RegisterState state = RegisterState();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verifyCodeController = TextEditingController();
  final loginController = Get.find<LoginController>();

  @override
  void onReady() {
    super.onReady();
    getValidateCode();
  }

  getValidateCode() {
    state.validateCode.value =
        '${HttpUtil.baseUrl}${Api.verify}?${Random().nextDouble()}';
  }

  Future register() async {
    if (formKey.currentState!.validate()) {
      try {
        state.loading.value = true;
        final registerRes = await Http.register({
          "username": accountController.text,
          "password": passwordController.text,
          "velCode": verifyCodeController.text
        });
        if (registerRes['msg'] == Constant.requestSuccess) {
          "注册成功".toast();
        } else {
          (registerRes['msg'] as String).toast();
          state.loading.value = false;
          return null;
        }
        final res = await Http.login({
          "username": accountController.text,
          "password": passwordController.text
        });
        state.loading.value = false;
        if (res['msg'] == Constant.requestSuccess) {
          Store.setLogin({
            "Account": accountController.text,
            "Password": passwordController.text
          });
          Get.offNamed(RouteConfig.index);
        } else {
          (res['msg'] as String).toast();
        }
      } catch (e) {
        state.loading.value = false;
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
