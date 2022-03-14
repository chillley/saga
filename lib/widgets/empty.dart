import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:saga/constant/constant.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          ExtendedImage.asset(
            "assets/images/no_data.png",
            width: 200,
          ),
          sizedBoxH16,
          const Text(
            '暂无数据',
            style: TextStyle(color: Constant.primaryTitleColor, fontSize: 14),
          )
        ],
      ),
    );
  }
}
