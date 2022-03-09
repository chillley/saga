import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:saga/constant/constant.dart';
import 'package:saga/pages/login/login_controller.dart';
import 'package:saga/routes/route_config.dart';
import 'package:saga/widgets/gradient_button.dart';

import 'register_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final controller = Get.find<RegisterController>();

  final state = Get.find<RegisterController>().state;

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

  _buildVerifyCodeField() {
    return TextFormField(
      controller: controller.verifyCodeController,
      cursorColor: Constant.themeColor,
      onChanged: (value) {
        if (controller.formKey.currentState!.validate()) {
          state.validate.value = true;
        }
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: InputBorder.none,
        floatingLabelStyle: const TextStyle(color: Constant.themeColor),
        filled: true,
        labelText: '验证码',
        hintText: '请输入验证码',
        hintStyle: const TextStyle(fontSize: 14.0),
        prefixIcon: const Icon(
          FluentIcons.clipboard_code_24_regular,
          color: Constant.themeColor,
        ),
        suffixIcon: SizedBox(
          width: 102,
          child: GestureDetector(
            child: Align(
                alignment: Alignment.center,
                child: Obx(
                  () => ExtendedImage.network(
                    state.validateCode.value,
                  ),
                )),
            onTap: () {
              controller.getValidateCode();
            },
          ),
        ),
      ),
      validator: (value) {
        return value!.isEmpty ? "验证码不能为空" : null;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            FluentIcons.dismiss_24_regular,
            color: Colors.black,
          ),
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        title: const Text('注册'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: edgeH24V16WithStatusBar,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildUserNameField(),
                        sizedBoxH16,
                        _buildPasswordField(),
                        sizedBoxH16,
                        _buildVerifyCodeField(),
                        sizedBoxH16,
                        Obx(
                          () => GradientButton(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            disabledTextColor: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(99)),
                            onPressed:
                                (!state.validate.value || state.loading.value)
                                    ? null
                                    : controller.register,
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
                                const Text('注册')
                              ],
                            ),
                          ),
                        ),
                        sizedBoxH16,
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('已有账号,直接的登录'))
                      ],
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
