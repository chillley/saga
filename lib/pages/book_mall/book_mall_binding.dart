import 'package:get/get.dart';

import 'book_mall_controller.dart';

class BookMallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookMallController());
  }
}
