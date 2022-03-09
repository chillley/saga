import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:saga/constant/constant.dart';
import 'package:saga/db/store.dart';
import 'package:saga/routes/route_config.dart';
import 'package:saga/services/index.dart';
import 'login_state.dart';

class LoginController extends GetxController {
  final LoginState state = LoginState();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future login() async {
    if (formKey.currentState!.validate()) {
      try {
        state.loading.value = true;
        final res = await Http.login({
          "username": accountController.text,
          "password": passwordController.text
        });
        state.loading.value = false;
        if (res['msg'] == Constant.requestSuccess) {
          "登录成功".toast();
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
  void onReady() {
    // TODO: implement onReady
    final login = Store.getLogin();
    accountController.text = login['Account'] ?? "";
    passwordController.text = login['Password'] ?? "";
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
