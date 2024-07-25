import 'package:flutter/material.dart';

import '../home/HomePage.dart';

Map<String, WidgetBuilder> getRouter = {
  '/' : (context) => const HomePage(),
};