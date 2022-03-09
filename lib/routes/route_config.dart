import 'package:get/get.dart';
import 'package:saga/pages/book_mall/book_mall_binding.dart';
import 'package:saga/pages/book_rack/book_rack_binding.dart';
import 'package:saga/pages/classify/classify_binding.dart';
import 'package:saga/pages/index/index_binding.dart';
import 'package:saga/pages/index/index_page.dart';
import 'package:saga/pages/login/login_binding.dart';
import 'package:saga/pages/login/login_page.dart';
import 'package:saga/pages/register/register_binding.dart';
import 'package:saga/pages/register/register_page.dart';
import 'package:saga/pages/splash/splash_binding.dart';
import 'package:saga/pages/splash/splash_page.dart';
import 'package:saga/pages/user/user_binding.dart';

class RouteConfig {
  static const String splash = "/splash";

  static const String login = "/login";

  static const String register = "/register";

  static const String index = "/index";

  static final List<GetPage> getPages = [
    GetPage(
      name: splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: register,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: index,
      page: () => IndexPage(),
      bindings: [
        IndexBinding(),
        UserBinding(),
        ClassifyBinding(),
        BookRackBinding(),
        BookMallBinding()
      ],
    ),
  ];
}
