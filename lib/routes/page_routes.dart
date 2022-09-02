import 'package:get/get.dart';
import 'name_route.dart';
import 'package:newsappnewversion/screens/registerscreen.dart';
import 'package:newsappnewversion/screens/loginscreen.dart';
import 'package:newsappnewversion/screens/homescreen.dart';

class PageRouteApp {
  static final pages = [
    GetPage(name: RouteName.page_login, page: () => LoginScreen()),
    GetPage(name: RouteName.page_register, page: () => const RegisterScreen()),
    GetPage(
        name: RouteName.pagenews_headline, page: () => const HeadlineNews()),
    GetPage(name: RouteName.pagenews_politics, page: () => const Politics()),
    GetPage(
        name: RouteName.pagenews_business, page: () => const BussinessNews()),
    GetPage(name: RouteName.pagenews_tech, page: () => const TechNews()),
  ];
}
