import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final controller = Get.find<SearchController>();
  final state = Get.find<SearchController>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
