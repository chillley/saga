import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'forget_password_controller.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({Key? key}) : super(key: key);

  final controller = Get.find<ForgetPasswordController>();
  final state = Get.find<ForgetPasswordController>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
