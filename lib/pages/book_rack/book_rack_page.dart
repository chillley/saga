import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'book_rack_controller.dart';

/// @description 书架页面
/// @date 2022/2/21 16:39
/// @author xialei

class BookRackPage extends StatelessWidget {
  const BookRackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookRackController>();
    final state = Get.find<BookRackController>().state;
    return const Text('书单');
  }
}
