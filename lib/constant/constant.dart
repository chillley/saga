import 'package:flutter/material.dart';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui';

/// @description 常量类
/// @date 2022/2/18 14:43
/// @author xialei

export 'extension.dart';
export 'top_const.dart';

class Constant {
  static bool get isMobile => isAndroid || isIOS;

  static bool get isWeb => kIsWeb;

  static bool get isWindows => !isWeb && Platform.isWindows;

  static bool get isLinux => !isWeb && Platform.isLinux;

  static bool get isMacOS => !isWeb && Platform.isMacOS;

  static bool get isAndroid => !isWeb && Platform.isAndroid;

  static bool get isFuchsia => !isWeb && Platform.isFuchsia;

  static bool get isIOS => !isWeb && Platform.isIOS;

  static final MediaQueryData mediaQueryData =
      MediaQueryData.fromWindow(window);

  static final Size screenSize = mediaQueryData.size;

  static final double screenWidth = screenSize.width;

  static final double screenHeight = screenSize.height;

  static late AndroidDeviceInfo _androidInfo;

  static Future<void> initDeviceInfo() async {
    if (isAndroid) {
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      _androidInfo = await deviceInfo.androidInfo;
    }
  }

  static const String requestSuccess = 'SUCCESS';

  /// 主题色
  static const Color themeColor = Color(0xFF3371FF);

  ///辅助色
  static const Color assistColor = Color(0xFFCBDBFF);

  /// 辅助色2
  static const Color assist2Color = Color(0xFF00D184);

  /// 辅助色3
  static const Color assist3Color = Color(0xFFFFA021);

  /// 点缀色
  static const Color intersperseColor = Color(0xFFFF5C5C);

  /// 一级标题
  static const Color primaryTitleColor = Color(0xFF333333);

  /// 正文 内容
  static const Color textColor = Color(0xFF666666);

  /// 辅助文字颜色
  static const Color assistTextColor = Color(0xFFCCCCCC);

  /// 书架 icon
  static const Icon bookRackIcon = Icon(Icons.menu_book);

  /// 分类 icon
  static const Icon classifyIcon = Icon(Icons.menu);

  /// 书城 icon
  static const Icon bookMallIcon = Icon(Icons.home);

  /// 我的 icon
  static const Icon userIcon = Icon(Icons.person);

  const Constant._();
}
