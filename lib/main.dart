import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:saga/pages/splash/splash_binding.dart';
import 'package:saga/pages/splash/splash_page.dart';
import 'package:saga/routes/route_config.dart';
import 'package:saga/services/http_util.dart';
import 'constant/constant.dart';
import 'db/hive_db.dart';

void main() async {
  await HiveDB.init();
  await _initDependencies();
  runApp(const MyApp());
}

Future _initDependencies() async {
  await HttpUtil.init();
  Get.changeTheme(ThemeData(
    primaryColor: Constant.themeColor,
    primaryColorLight: Constant.themeColor,
    primaryColorDark: Constant.themeColor,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Constant.themeColor),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  void _subscribeConnectivityChange() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.wifi:
          "您正在使用WiFi网络".toast();
          break;
        case ConnectivityResult.mobile:
          "您正在使用移动网络".toast();
          break;
        case ConnectivityResult.none:
          "您已断开网络".toast();
          break;
        case ConnectivityResult.ethernet:
          "您正在使用以太网".toast();
          break;
        case ConnectivityResult.bluetooth:
          "您正在使用蓝牙".toast();
          break;
      }
    });
  }

  GetMaterialApp _getMaterialApp() {
    return GetMaterialApp(
      title: 'saga小说',
      initialRoute: '/',
      initialBinding: SplashBinding(),
      theme: ThemeData(fontFamily: 'HarmonyOS_Sans'),
      navigatorObservers: [GetObserver(), FlutterSmartDialog.observer],
      builder: (context, child) {
        return FlutterSmartDialog(
          child: Scaffold(
            body: GestureDetector(
              onTap: () {
                hideKeyboard(context);
              },
              child: child,
            ),
          ),
        );
      },
      getPages: RouteConfig.getPages,
      home: const SplashPage(),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterSmartDialog.monitor();
    if (Constant.isMobile) {
      _subscribeConnectivityChange();
    }
    return _getMaterialApp();
  }
}
