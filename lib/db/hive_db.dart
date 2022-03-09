import 'dart:io';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxKey {
  const HiveBoxKey._();

  static const String login = "KEY_LOGIN";
}

class HiveDB {
  const HiveDB._();

  static late Box db;
  static late Directory cacheDir;
  static late Directory filesDir;
  static late String cookiesPath;

  static init() async {
    // filesDir = await getApplicationSupportDirectory();
    // cacheDir = await getTemporaryDirectory();
    // // cookiesPath = cacheDir?.path! + "/cookies";
    //
    // Hive.init("${filesDir.path}${Platform.pathSeparator}hivedb");

    await Hive.initFlutter();

    db = await Hive.openBox("DB");
  }
}
