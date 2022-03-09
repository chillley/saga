import 'package:get/get.dart';


class RegisterState {
  late final RxBool showPassword;
  late final RxBool validate;
  late final RxString validateCode;
  late final RxBool loading;

  RegisterState() {
    showPassword = false.obs;
    validate = false.obs;
    loading = false.obs;
    validateCode = ''.obs;
  }
}
