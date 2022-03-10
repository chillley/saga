import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saga/constant/constant.dart';

import 'book_mall_controller.dart';

class BookMallPage extends StatelessWidget {
  BookMallPage({Key? key}) : super(key: key);

  final controller = Get.find<BookMallController>();
  final state = Get.find<BookMallController>().state;

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 50.0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Expanded(
              child: Obx(
            () => TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              indicatorColor: Constant.themeColor,
              controller: controller.tabController,
              tabs: state.tabList.map((tab) => Tab(text: tab.name)).toList(),
            ),
          )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Constant.primaryTitleColor,
              ))
        ],
      ),
    );
  }

  _buildTabBarView() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildTabBarView(),
    );
  }
}
