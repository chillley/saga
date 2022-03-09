import 'dart:io';

import 'hive_db.dart';

/// @description  数据存储 hive
/// @date 2022/3/3 18:05
/// @author xialei

class Store {
  const Store._();

  static setLogin(final Map<String, dynamic> login) {
    HiveDB.db.put(HiveBoxKey.login, login);
  }

  static removeLogin() {
    HiveDB.db.delete(HiveBoxKey.login);
  }

  static Map<String, dynamic> getLogin() {
    return HiveDB.db.get(HiveBoxKey.login,
        defaultValue: <String, dynamic>{}).cast<String, dynamic>();
  }
}
