import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'book_mall_controller.dart';

class BookMallPage extends StatelessWidget {
  const BookMallPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookMallController>();
    final state = Get.find<BookMallController>().state;
    return const Text('书城');
  }
}
