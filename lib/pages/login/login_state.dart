import 'package:get/get.dart';

class LoginState {
  late final RxBool showPassword;
  late final RxBool rememberMe;
  late final RxBool validate;
  late final RxBool loading;


  LoginState() {
    showPassword = false.obs;
    rememberMe = false.obs;
    validate = false.obs;
    loading = false.obs;
  }
}
