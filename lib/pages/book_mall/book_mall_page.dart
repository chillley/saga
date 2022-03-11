import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:saga/constant/constant.dart';
import 'package:saga/model/setting_book_entity.dart';
import 'package:extended_text/extended_text.dart';

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
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Constant.themeColor,
                controller: controller.tabController,
                tabs: [
                  const Tab(text: '精选'),
                  ...state.tabList.map((tab) => Tab(text: tab.name)).toList()
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Constant.primaryTitleColor,
            ),
          )
        ],
      ),
    );
  }

  _buildRecommend(String name, RxList<SettingBookEntity> list) {
    double gridWidth = (Constant.screenWidth / 3) - 20;
    return Obx(
      () => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          padding: edge10,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              sizedBoxH16,
              GridView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.45,
                ),
                itemBuilder: (BuildContext context, int index) {
                  SettingBookEntity book = list[index];
                  return InkWell(
                    child: Column(
                      children: [
                        SizedBox(
                          width: gridWidth - 20,
                          height: (1.35 * (gridWidth - 20)),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3.0)),
                            child: ExtendedImage.network(
                              imageUrlLoad(book.picUrl.toString()),
                              cache: true,
                              width: gridWidth,
                              height: (2 * gridWidth) - 50,
                              fit: BoxFit.fill,
                              loadStateChanged: (ExtendedImageState state) {
                                if (state.extendedImageLoadState ==
                                        LoadState.failed ||
                                    state.extendedImageLoadState ==
                                        LoadState.loading) {
                                  return Image.asset("assets/images/no.gif",
                                      fit: BoxFit.none);
                                }
                              },
                            ),
                          ),
                        ),
                        sizedBoxH12,
                        SizedBox(
                          height: 16,
                          child: Text(
                            isNullText(book.bookName),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 13,
                                color: Constant.textColor,
                                fontWeight: FontWeight.w400),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildThisWeekSPush() {
    double gridWidth = (Constant.screenWidth / 4) - 20;
    return Obx(() {
      SettingBookEntity thisWeekSPushNo1 = state.thisWeekSPushList[0];
      final List<SettingBookEntity> thisWeekSPushOther =
          state.thisWeekSPushList.sublist(1, state.thisWeekSPushList.length);

      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          padding: edge10,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '本周强推',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 160,
                child: Row(
                  children: [
                    SizedBox(
                      height: 140,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3.0)),
                        child: ExtendedImage.network(
                          imageUrlLoad(thisWeekSPushNo1.picUrl.toString()),
                          cache: true,
                          width: 105,
                          height: 140,
                          fit: BoxFit.fill,
                          loadStateChanged: (ExtendedImageState state) {
                            if (state.extendedImageLoadState ==
                                    LoadState.failed ||
                                state.extendedImageLoadState ==
                                    LoadState.loading) {
                              return Image.asset("assets/images/no.gif",
                                  fit: BoxFit.none);
                            }
                          },
                        ),
                      ),
                    ),
                    sizedBoxW24,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizedBoxH16,
                          Text(
                            isNullText(thisWeekSPushNo1.bookName),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 15, color: Constant.textColor),
                          ),
                          sizedBoxH16,
                          Text(
                            isNullText(thisWeekSPushNo1.authorName),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 12, color: Constant.assistTextColor),
                          ),
                          sizedBoxH16,
                          ExtendedText(
                            isNullText(thisWeekSPushNo1.bookDesc),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Constant.assistTextColor,
                            ),
                            maxLines: 5,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: thisWeekSPushOther.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  crossAxisCount: 4,
                  childAspectRatio: 1 / 1.45,
                ),
                itemBuilder: (BuildContext context, int index) {
                  SettingBookEntity book = thisWeekSPushOther[index];
                  return InkWell(
                    child: Column(
                      children: [
                        SizedBox(
                          width: gridWidth - 20,
                          height: (1.35 * (gridWidth - 20)),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3.0)),
                            child: ExtendedImage.network(
                              imageUrlLoad(book.picUrl.toString()),
                              cache: true,
                              width: gridWidth,
                              height: (2 * gridWidth) - 50,
                              fit: BoxFit.fill,
                              loadStateChanged: (ExtendedImageState state) {
                                if (state.extendedImageLoadState ==
                                        LoadState.failed ||
                                    state.extendedImageLoadState ==
                                        LoadState.loading) {
                                  return Image.asset("assets/images/no.gif",
                                      fit: BoxFit.none);
                                }
                              },
                            ),
                          ),
                        ),
                        sizedBoxH12,
                        SizedBox(
                          height: 16,
                          child: Text(
                            isNullText(book.bookName),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 13,
                                color: Constant.textColor,
                                fontWeight: FontWeight.w400),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }

  _buildRanking10() {
    return Obx(() {
      SettingBookEntity book = state.recommendedList[0];
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          padding: edge10,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '本周强推',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.recommendedList.length,
                itemBuilder: (BuildContext context, int index) {
                  SettingBookEntity book = state.recommendedList[index];
                  return SizedBox(
                    height: 160,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 140,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3.0)),
                            child: ExtendedImage.network(
                              imageUrlLoad(book.picUrl.toString()),
                              cache: true,
                              width: 105,
                              height: 140,
                              fit: BoxFit.fill,
                              loadStateChanged: (ExtendedImageState state) {
                                if (state.extendedImageLoadState ==
                                        LoadState.failed ||
                                    state.extendedImageLoadState ==
                                        LoadState.loading) {
                                  return Image.asset("assets/images/no.gif",
                                      fit: BoxFit.none);
                                }
                              },
                            ),
                          ),
                        ),
                        sizedBoxW24,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sizedBoxH16,
                              Text(
                                isNullText(book.bookName),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 15, color: Constant.textColor),
                              ),
                              sizedBoxH16,
                              Text(
                                isNullText(book.authorName),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Constant.assistTextColor),
                              ),
                              sizedBoxH16,
                              ExtendedText(
                                isNullText(book.bookDesc),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Constant.assistTextColor,
                                ),
                                maxLines: 5,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  _buildSelectionPage() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: edge10,
        child: Column(
          children: [
            _buildRanking10(),
            sizedBoxH16,
            _buildThisWeekSPush(),
            sizedBoxH16,
            _buildRecommend('热门推荐', state.hotRecommendedList),
            sizedBoxH16,
            _buildRecommend('精品推荐', state.recommendationList)
          ],
        ),
      ),
    );
  }

  _buildTabBarView() {
    return TabBarView(
      controller: controller.tabController,
      children: [
        _buildSelectionPage(),
        ...state.tabList.map((element) => Container()).toList()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildTabBarView(),
    );
  }
}
