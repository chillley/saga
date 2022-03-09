import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saga/constant/constant.dart';

class IndexState {
  late List<Map<String, dynamic>> bottomNavigation;

  var pageIndex = 0.obs;

  IndexState() {
    ///Initialize variables
    bottomNavigation = [
      {'label': '书架', 'icon': Constant.bookRackIcon},
      {'label': '分类', 'icon': Constant.classifyIcon},
      {'label': '书城', 'icon': Constant.bookMallIcon},
      {'label': '我的', 'icon': Constant.userIcon},
    ];
  }
}
