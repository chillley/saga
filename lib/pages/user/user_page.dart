import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:saga/constant/constant.dart';
import 'package:saga/db/store.dart';
import 'package:saga/widgets/gradient_button.dart';

import 'user_controller.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  _topContent() {
    return Container(
      color: Colors.white,
      height: 120,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        child: Image.asset(
          "assets/images/default_user_header_photo.png",
          height: 80,
          width: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, IconData icon, String title,
          {VoidCallback? onTap}) =>
      ListTile(
        leading: Icon(
          icon,
          color: Constant.themeColor,
        ),
        title: Text(title),
        trailing: const Icon(
          Icons.chevron_right,
          color: Constant.themeColor,
        ),
        onTap: () {
          return "暂未实现".toast();
        },
      );

  _listContent(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          _buildItem(context, Icons.settings, '应用设置'),
          _buildItem(context, Icons.construction, '数据管理'),
          _buildItem(context, Icons.history, '历史记录'),
          _buildItem(context, Icons.collections, '我的收藏'),
          const Divider(
            height: 1,
          ),
          _buildItem(context, Icons.update, '版本信息'),
          _buildItem(context, Icons.info, '关于应用'),
          const Divider(
            height: 1,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();
    final state = Get.find<UserController>().state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
        title: const Text('我的'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _topContent(),
            _listContent(context),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
              height: 48,
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: GradientButton(
                  borderRadius: const BorderRadius.all(Radius.circular(99)),
                  onPressed: () {
                    Store.removeLogin();
                    SystemNavigator.pop();
                  },
                  child: const Text('退出'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
