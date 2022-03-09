import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:saga/constant/extension.dart';

/// @description  Dio 封装
/// @date 2022/2/18 13:45
/// @author xialei

// dio 拦截器
class HttpInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    '加载中...'.loading();
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    SmartDialog.dismiss(status: SmartStatus.loading);
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.other) {
      var connectivityResult = await (Connectivity().checkConnectivity());
      // 判断是否联网
      if (connectivityResult == ConnectivityResult.none) {
        '当前网络不可用,请检查网络设置'.toast();
        return super.onError(err, handler);
      }
    }
    '网络错误'.toast();
    SmartDialog.dismiss(status: SmartStatus.loading);
    return super.onError(err, handler);
  }
}

class HttpUtil {
  static const String baseUrl = 'http://111.229.255.133:8085';

  static late final Dio _dio;

  static Future<void> init() async {
    _dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          followRedirects: false,
          contentType: "application/x-www-form-urlencoded;charset=UTF-8",
          connectTimeout: 30000,
          receiveTimeout: 30000),
    );

    _dio
      ..interceptors
          .add(LogInterceptor(requestBody: false, responseBody: false))
      ..interceptors.add(HttpInterceptor());
  }

  // 封装post方法
  static Future post(
    String path, {
    Map<String, dynamic> params = const {},
    data = const {},
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await _dio.post(
      path,
      data: data,
      queryParameters: params,
      options: requestOptions,
    );
    return response.data;
  }

  // 封装get方法
  static Future get(
    String path, {
    Map<String, dynamic>? params = const {},
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await _dio.get(
      path,
      queryParameters: params,
      options: requestOptions,
    );
    return response.data;
  }
}
