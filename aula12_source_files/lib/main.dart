import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_app/presentation/pages/home/home_page.dart';
import 'package:mobx_app/presentation/pages/home/stores/home_page_store.dart';
import 'package:mobx_app/presentation/pages/lista_de_produtos/stores/lista_de_produtos_store.dart';

void main() {
  GetIt.I.registerSingleton<HomePageStore>(HomePageStore());
  GetIt.I.registerSingleton<ListaDeProdutosStore>(ListaDeProdutosStore());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MobX App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
