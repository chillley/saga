import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saga/constant/constant.dart';
import 'package:saga/pages/book_mall/book_mall_page.dart';
import 'package:saga/pages/book_rack/book_rack_page.dart';
import 'package:saga/pages/classify/classify_page.dart';
import 'package:saga/pages/user/user_page.dart';
import 'package:saga/widgets/double_tap_back_exit_app.dart';

import 'index_controller.dart';

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);

  final controller = Get.find<IndexController>();
  final state = Get.find<IndexController>().state;

  PageView _pageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      children: [BookMallPage(), const BookRackPage(), const ClassifyPage(), const UserPage()],
    );
  }

  _bottomNavigationBar() {
    List<BottomNavigationBarItem> bottomNavigationItems = state.bottomNavigation
        .map((item) => BottomNavigationBarItem(
              label: item['label'],
              icon: item['icon'],
            ))
        .toList();
    return Obx(
      () => BottomNavigationBar(
        onTap: (index) {
          controller.onChangePageIndex(index);
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: state.pageIndex.value,
        selectedIconTheme: const IconThemeData(color: Constant.themeColor),
        selectedItemColor: Constant.themeColor,
        iconSize: 21.0,
        selectedFontSize: 12.0,
        unselectedFontSize: 11.0,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: bottomNavigationItems,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DoubleTapBackExitApp(
      child: Scaffold(
        body: _pageView(),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }
}
