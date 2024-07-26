import 'package:flutter/material.dart';
import 'package:pokedex_petit/domain/CapturedService.dart';
import 'package:pokedex_petit/domain/DetailService.dart';
import 'package:pokedex_petit/domain/PokemonService.dart';
import 'package:pokedex_petit/ui/route/router.dart';
import 'package:provider/provider.dart';

import 'data/local/Preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonService(), lazy: false,),
        ChangeNotifierProvider(create: (_) => DetailService(), lazy: false,),
        ChangeNotifierProvider(create: (_) => CapturedService(), lazy: false,)
      ],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Petit',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      routes: getRouter,
      initialRoute: '/',
    );
  }
}
