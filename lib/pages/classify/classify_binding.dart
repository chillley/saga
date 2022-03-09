import 'package:get/get.dart';

import 'classify_controller.dart';

class ClassifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClassifyController());
  }
}
