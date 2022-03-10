import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saga/constant/constant.dart';
import 'package:saga/model/category_entity.dart';
import 'package:saga/services/index.dart';

import 'book_mall_state.dart';

class BookMallController extends GetxController
    with GetTickerProviderStateMixin {
  final BookMallState state = BookMallState();
  late TabController tabController =
      TabController(initialIndex: 0, length: 0, vsync: this);

  queryBookCategory() async {
    Map<String, dynamic> res = await Http.queryBookCategory();
    if (res['msg'] == Constant.requestSuccess) {
      List data = res['data'];
      Map<String, dynamic> selectionOfRecommended = {
        "id": "-1",
        "name": "精选推荐",
        "workDirection": null,
        "sort": null,
        "createUserId": null,
        "createTime": null,
        "updateUserId": null,
        "updateTime": null,
      };
      state.tabList.value = [
        CategoryEntity.fromJson(selectionOfRecommended),
        ...data.map((row) => CategoryEntity.fromJson(row)).toList()
      ];
      tabController = TabController(
          initialIndex: 0, length: state.tabList.length, vsync: this);
    }
  }

  queryListBookSetting() async {
    Map<String, dynamic> res = await Http.queryListBookSetting();
    if (res['msg'] == Constant.requestSuccess) {
      List data = res['data'];
      state.carouselList.value = data[0];
      state.recommendedList.value = data[1];
      state.thisWeekSPushList.value = data[2];
      state.hotRecommendedList.value = data[3];
      state.recommendationList.value = data[4];
    }
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    await queryBookCategory();
    await queryListBookSetting();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
