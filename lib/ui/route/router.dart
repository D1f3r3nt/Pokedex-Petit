import 'package:flutter/material.dart';
import 'package:pokedex_petit/ui/captured/CapturedPage.dart';
import 'package:pokedex_petit/ui/detail/DetailPage.dart';

import '../home/HomePage.dart';

Map<String, WidgetBuilder> getRouter = {
  '/' : (context) => const HomePage(),
  'detail' : (context) => const DetailPage(),
  'captured' : (context) => const CapturedPage(),
};