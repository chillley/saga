import 'package:dio/dio.dart';

import 'api.dart';
import 'http_util.dart';

class Http {
  static final Options _loginOptions =
      Options(contentType: 'application/x-www-form-urlencoded;charset=UTF-8');

  static login(data) {
    return HttpUtil.post(Api.login, data: data, options: _loginOptions);
  }

  static register(data) {
    return HttpUtil.post(Api.register, data: data);
  }

  static queryBookCategory() {
    return HttpUtil.get(Api.queryBookCategory);
  }

  static queryListBookSetting() {
    return HttpUtil.get(Api.queryListBookSetting);
  }
}
