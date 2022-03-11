import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saga/constant/constant.dart';
import 'package:saga/model/category_entity.dart';
import 'package:saga/model/setting_book_entity.dart';
import 'package:saga/services/index.dart';

import 'book_mall_state.dart';

class BookMallController extends GetxController
    with GetTickerProviderStateMixin {
  final BookMallState state = BookMallState();
  late TabController tabController =
      TabController(initialIndex: 0, length: 1, vsync: this);

  queryBookCategory() async {
    Map<String, dynamic> res = await Http.queryBookCategory();
    if (res['msg'] == Constant.requestSuccess) {
      List data = res['data'];
      state.tabList.value =
          data.map((row) => CategoryEntity.fromJson(row)).toList();
      tabController = TabController(
          initialIndex: 0, length: state.tabList.length + 1, vsync: this);
    }
  }

  queryListBookSetting() async {
    Map<String, dynamic> res = await Http.queryListBookSetting();
    if (res['msg'] == Constant.requestSuccess) {
      Map<String, dynamic> data = Map<String, dynamic>.from(res['data']!);
      state.carouselList.value = data['0']
          .map<SettingBookEntity>((row) => SettingBookEntity.fromJson(row))
          .toList();
      state.recommendedList.value = data['1']
          .map<SettingBookEntity>((row) => SettingBookEntity.fromJson(row))
          .toList();
      state.thisWeekSPushList.value = data['2']
          .map<SettingBookEntity>((row) => SettingBookEntity.fromJson(row))
          .toList();
      state.hotRecommendedList.value = data['3']
          .map<SettingBookEntity>((row) => SettingBookEntity.fromJson(row))
          .toList();
      state.recommendationList.value = data['4']
          .map<SettingBookEntity>((row) => SettingBookEntity.fromJson(row))
          .toList();
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
