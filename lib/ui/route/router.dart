import 'package:flutter/material.dart';
import 'package:pokedex_petit/ui/detail/DetailPage.dart';

import '../home/HomePage.dart';

Map<String, WidgetBuilder> getRouter = {
  '/' : (context) => const HomePage(),
  'detail' : (context) => const DetailPage(),
};