import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'classify_controller.dart';

class ClassifyPage extends StatelessWidget {
  const ClassifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClassifyController>();
    final state = Get.find<ClassifyController>().state;
    return const Text('分类');
  }
}
