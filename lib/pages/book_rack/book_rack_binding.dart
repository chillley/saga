import 'package:get/get.dart';

import 'book_rack_controller.dart';

class BookRackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookRackController());
  }
}
