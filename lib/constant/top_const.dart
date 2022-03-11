import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saga/services/http_util.dart';
import 'dart:io';

import 'screen.dart';

/// status light
const SystemUiOverlayStyle lightSystemUiOverlayStyle = SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarDividerColor: Colors.transparent,
  statusBarColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.dark,
);

/// status light
const SystemUiOverlayStyle darkSystemUiOverlayStyle = SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.black,
  systemNavigationBarDividerColor: Colors.black,
  statusBarColor: Colors.black,
  systemNavigationBarIconBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.dark,
);

const sizedBoxW24 = SizedBox(width: 24.0);
const sizedBoxH42 = SizedBox(height: 42.0);
const sizedBoxH16 = SizedBox(height: 16.0);
const sizedBoxH12 = SizedBox(height: 12.0);
const sizedBoxH6 = SizedBox(height: 6.0);
const sizedBoxW12 = SizedBox(width: 12.0);

final edgeH24V16WithStatusBar = EdgeInsets.only(
  top: Screen.statusBarHeight + 16.0,
  bottom: 36.0,
  left: 24.0,
  right: 24.0,
);

const edge10 = EdgeInsets.only(
  left: 10.0,
  right: 10.0,
  top: 10.0,
  bottom: 10.0,
);
const edgeH10 = EdgeInsets.only(
  left: 10.0,
  right: 10.0,
);
const edgV10 = EdgeInsets.only(
  top: 10.0,
  bottom: 10.0,
);

final normalFormHeader = Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    ExtendedImage.asset(
      "assets/images/logo.png",
      width: 72.0,
    ),
    sizedBoxW24,
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text(
          "saga 小说",
          style: TextStyle(
            fontSize: 32.0,
            height: 1.25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    )
  ],
);

isNullText(String? text) {
  return (text ?? '').isEmpty ? '未知' : text ?? '';
}

imageUrlLoad(String url) {
  if (url.isNotEmpty && !url.contains("http")) {
    return '${HttpUtil.baseUrl}$url';
  }
  return url;
}
