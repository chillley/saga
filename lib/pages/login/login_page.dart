import 'package:extended_image/extended_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:saga/constant/constant.dart';
import 'package:saga/routes/route_config.dart';
import 'package:saga/widgets/gradient_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final controller = Get.find<LoginController>();
  final state = Get.find<LoginController>().state;

  _buildUserNameField() {
    return TextFormField(
      controller: controller.accountController,
      cursorColor: Constant.themeColor,
      autofocus: true,
      onChanged: (value) {
        if (controller.formKey.currentState!.validate()) {
          state.validate.value = true;
        }
      },
      decoration: const InputDecoration(
        fillColor: Colors.white,
        border: InputBorder.none,
        floatingLabelStyle: TextStyle(color: Constant.themeColor),
        filled: true,
        labelText: '手机号',
        hintText: '请输入手机号',
        hintStyle: TextStyle(fontSize: 14.0),
        prefixIcon: Icon(
          FluentIcons.person_24_regular,
          color: Constant.themeColor,
        ),
      ),
      validator: (value) {
        return value!.isEmpty ? "手机号码不能为空" : null;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
    );
  }

  _buildPasswordField() {
    return Obx(() => TextFormField(
          obscureText: !state.showPassword.value,
          cursorColor: Constant.themeColor,
          controller: controller.passwordController,
          onChanged: (value) {
            if (controller.formKey.currentState!.validate()) {
              state.validate.value = true;
            }
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            floatingLabelStyle: const TextStyle(color: Constant.themeColor),
            border: InputBorder.none,
            labelText: '密码',
            hintText: '请输入密码',
            hintStyle: const TextStyle(fontSize: 14.0, letterSpacing: 0.0),
            prefixIcon: const Icon(
              FluentIcons.password_24_regular,
              color: Constant.themeColor,
            ),
            suffixIcon: GestureDetector(
              child: const Icon(
                Icons.remove_red_eye_outlined,
                color: Constant.textColor,
              ),
              onTap: () {
                state.showPassword.value = !state.showPassword.value;
              },
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) return "密码不能为空";
            if (value.length < 6) return "密码最少6位";
            return null;
          },
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
        ));
  }

  _buildRememberRow() {
    return Obx(() => Row(
          children: <Widget>[
            Checkbox(
              value: state.rememberMe.value,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: Constant.themeColor,
              onChanged: (val) {
                state.rememberMe.value = val ?? false;
              },
            ),
            const Expanded(
                child: Text(
              "记住密码",
              style: TextStyle(color: Constant.textColor),
            )),
            TextButton(
              onPressed: () {
                Get.toNamed(RouteConfig.register);
              },
              child: const Text(
                "注册新账号",
                style: TextStyle(color: Constant.primaryTitleColor),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        title: const Text('登录'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: edgeH24V16WithStatusBar,
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // ExtendedImage.asset(
                          //   "assets/images/login.png",
                          //   width: 200,
                          // ),
                          sizedBoxH12,
                          _buildUserNameField(),
                          sizedBoxH16,
                          _buildPasswordField(),
                          sizedBoxH16,
                          _buildRememberRow(),
                          sizedBoxH12,
                          Obx(
                            () => GradientButton(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              disabledTextColor: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(99)),
                              onPressed:
                                  (!state.validate.value || state.loading.value)
                                      ? null
                                      : controller.login,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (state.loading.value)
                                    const SpinKitWave(
                                      size: 20.0,
                                      type: SpinKitWaveType.center,
                                      color: Colors.white,
                                    ),
                                  sizedBoxW12,
                                  const Text('登录')
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
