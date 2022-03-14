import 'package:saga/model/category_entity.dart';
import 'package:get/get.dart';
import 'package:saga/model/setting_book_entity.dart';
import 'package:saga/model/type_book_entity.dart';

class BookMallState {
  late final RxList<CategoryEntity> tabList = RxList<CategoryEntity>([]);
  late final RxList<SettingBookEntity> thisWeekSPushList =
      RxList<SettingBookEntity>([]);
  late final RxList<SettingBookEntity> hotRecommendedList =
      RxList<SettingBookEntity>([]);
  late final RxList<SettingBookEntity> recommendationList =
      RxList<SettingBookEntity>([]);
  late final RxList<SettingBookEntity> recommendedList =
      RxList<SettingBookEntity>([]);
  late final RxList<SettingBookEntity> carouselList =
      RxList<SettingBookEntity>([]);
  late final RxList<TypeBookEntity> typeBookList =
  RxList<TypeBookEntity>([]);


  BookMallState() {
    tabList.value = [];
    carouselList.value = [];
    thisWeekSPushList.value = [];
    hotRecommendedList.value = [];
    recommendationList.value = [];
    recommendedList.value = [];
    typeBookList.value = [];
  }
}
