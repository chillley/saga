import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saga/constant/constant.dart';
import 'package:saga/model/category_entity.dart';
import 'package:saga/model/setting_book_entity.dart';
import 'package:extended_text/extended_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:saga/model/type_book_entity.dart';
import 'package:saga/widgets/empty.dart';

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
                  crossAxisSpacing: 0,
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.48,
                ),
                itemBuilder: (BuildContext context, int index) {
                  SettingBookEntity book = list[index];
                  return InkWell(
                    child: Column(
                      children: [
                        SizedBox(
                          width: gridWidth - 10,
                          height: (1.48 * gridWidth) - 28,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3.0)),
                            child: ExtendedImage.network(
                              imageUrlLoad(book.picUrl.toString()),
                              cache: true,
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
      if (state.thisWeekSPushList.isNotEmpty) {
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
                            sizedBoxH12,
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
                                  fontSize: 12,
                                  color: Constant.assistTextColor),
                            ),
                            sizedBoxH16,
                            Text(
                              isNullText(thisWeekSPushNo1.bookDesc),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Constant.assistTextColor,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
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
                    crossAxisSpacing: 0,
                    crossAxisCount: 4,
                    childAspectRatio: 1 / 1.48,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    SettingBookEntity book = thisWeekSPushOther[index];
                    return InkWell(
                      child: Column(
                        children: [
                          SizedBox(
                            width: gridWidth - 10,
                            height: (1.48 * gridWidth) - 28,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(3.0),
                              ),
                              child: ExtendedImage.network(
                                imageUrlLoad(book.picUrl.toString()),
                                cache: true,
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
                                fontWeight: FontWeight.w400,
                              ),
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
      }
      return Container();
    });
  }

  _buildRanking10() {
    return Obx(() {
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          padding: edge10,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '本周排名Top10',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.recommendedList.length,
                itemBuilder: (BuildContext context, int index) {
                  SettingBookEntity book = state.recommendedList[index];
                  return Column(
                    children: [
                      sizedBoxH16,
                      SizedBox(
                        height: 155,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 155,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(3.0)),
                                child: ExtendedImage.network(
                                  imageUrlLoad(book.picUrl.toString()),
                                  cache: true,
                                  width: 115,
                                  height: 155,
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
                                  Text(
                                    isNullText(book.bookName),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Constant.textColor),
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
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Constant.assistTextColor,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  _buildSwiper() {
    return SizedBox(
      height: 280,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Obx(
          () => Container(
            padding: edge10,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '个性推荐',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    SettingBookEntity book = state.carouselList[index];
                    return ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: ExtendedImage.network(
                        imageUrlLoad(book.picUrl.toString()),
                        cache: true,
                        fit: BoxFit.scaleDown,
                        loadStateChanged: (ExtendedImageState state) {
                          if (state.extendedImageLoadState ==
                                  LoadState.failed ||
                              state.extendedImageLoadState ==
                                  LoadState.loading) {
                            return Image.asset(
                              "assets/images/no.gif",
                              fit: BoxFit.none,
                            );
                          }
                        },
                      ),
                    );
                  },
                  itemCount: state.carouselList.length,
                  viewportFraction: 0.8,
                  scale: 0.9,
                  itemHeight: 230,
                  itemWidth: 180.0,
                  layout: SwiperLayout.STACK,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildSelectionPage() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: edge10,
        child: Column(
          children: [
            // _buildSwiper(),
            // sizedBoxH16,
            _buildThisWeekSPush(),
            sizedBoxH16,
            _buildRecommend('热门推荐', state.hotRecommendedList),
            sizedBoxH16,
            _buildRecommend('精品推荐', state.recommendationList),
            sizedBoxH16,
            _buildRanking10(),
          ],
        ),
      ),
    );
  }

  _buildTypeListView(CategoryEntity tab) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: state.typeBookList.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: state.typeBookList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                TypeBookEntity book = state.typeBookList[index];
                return Container(
                  padding: edge10,
                  color: Colors.white,
                  child: SizedBox(
                    height: 155,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 155,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3.0)),
                            child: ExtendedImage.network(
                              imageUrlLoad(book.picUrl.toString()),
                              cache: true,
                              width: 115,
                              height: 155,
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
                              Text(
                                isNullText(book.bookName),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 15, color: Constant.textColor),
                              ),
                              sizedBoxH12,
                              Text(
                                isNullText(book.authorName),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Constant.assistTextColor),
                              ),
                              sizedBoxH12,
                              ExtendedText(
                                isNullText(book.bookDesc),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Constant.assistTextColor,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              sizedBoxH12,
                              Text(
                                '最新章节：${isNullText(book.lastIndexName)}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Constant.primaryTitleColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          : const Empty(),
    );
  }

  _buildTabBarView() {
    return Obx(
      () => TabBarView(
        controller: controller.tabController,
        children: [
          _buildSelectionPage(),
          ...state.tabList.map((tab) => _buildTypeListView(tab)).toList()
        ],
      ),
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
