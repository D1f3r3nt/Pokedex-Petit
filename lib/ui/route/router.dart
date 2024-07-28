import 'package:flutter/material.dart';
import 'package:pokedex_petit/ui/captured/CapturedPage.dart';
import 'package:pokedex_petit/ui/detail/DetailPage.dart';

import '../home/HomePage.dart';

Map<String, WidgetBuilder> getRouter = {
  NavigationRouter.HOME : (context) => const HomePage(),
  NavigationRouter.DETAIL : (context) => const DetailPage(),
  NavigationRouter.CAPTURED : (context) => const CapturedPage(),
};

class NavigationRouter {
  static String HOME = "/";
  static String DETAIL = "detail";
  static String CAPTURED = "captured";
}